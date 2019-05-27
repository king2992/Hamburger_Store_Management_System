    class Carousel {
      constructor(config) {
        // 기본 설정과 사용자 지정 설정을 병합
        this.config = Carousel.mergeConfig(config);

        // DOM
        this.carousel = document.querySelector(this.config.selector);
        this.container = this.carousel.querySelector('.carousel-item-container');
        this.item = this.carousel.querySelector('.carousel-item');
        this.items = this.carousel.querySelectorAll('.carousel-item');
        this.prev = this.carousel.querySelector('.prev');
        this.next = this.carousel.querySelector('.next');

        // 캐러셀 아이템의 width
        this.itemWidth = this.item.offsetWidth;
        // 캐러셀 아이템의 height
        this.itemHeight = this.item.offsetHeight;
        // 캐러셀 아이템의 개수
        this.itemLength = this.items.length;

        // 캐러셀 이동 거리
        this.offset = 0;
        // 현재 표시 중인 캐러셀 아이템
        this.currentItem = 1;
        // transition 진행 상태
        this.isTransiting = false;

        this.init();
        this.attachEvent();
      }

      static mergeConfig(config) {
        // 기본 설정 정보
        const defaultConfig = {
          selector: '.carousel',
          duration: 200,
          easing: 'ease-out',
          infinite: true, // Infinite loop sliding
        };

        return { defaultConfig, config };
      }

      init() {
        /*
          carousel-item의 width/height는 가변적이다.
          따라서 carousel의 윈도우 역할을 하는 carousel 요소의 width/height는
          첫번째 carousel-item의 width/height를 취득해 셋팅한다.
        */
        this.carousel.style.width = this.itemWidth + 'px';
        this.carousel.style.height = this.itemHeight + 'px';

        // 무한 루핑 여부에 따라
        if (this.config.infinite) {
          // 첫번째, 마지막 요소를 클론하여 슬라이더에 추가
          this.insertClone();
          // 캐러셀 리스트의 선두는 클론 요소이므로 캐러셀 아이템의 width만큼 이동
          this.offset = -this.itemWidth;
          this.moveWithoutAnimation();
        } else {
          // prev, next 버튼 활성화/비활성화 결정
          this.checkMovable();
        }

        /*
          초기 화면에서 나타나는 요소의 크기 조정에 따른 요소의 크기 변화가 보이지 않도록
          캐러셀을 감추고 있다가 요소의 크기 조정이 종료하면 나타낸다.
          opacity는 GPU를 사용하므로 visibility보다 빠르다. visibility는 페인팅에 영향을 준다.
        */
        this.carousel.style.opacity = 1;
      }

      attachEvent() {
        // 핸들러 내부의 this가 Carousel 클래스의 인스턴스를 가리키도록 this를 바인딩한다.
        this.prev.addEventListener('click', this.moveToPrev.bind(this));
        this.next.addEventListener('click', this.moveToNext.bind(this));
        // transition 중에 발생한 이동 요청은 무시한다.
        this.container.addEventListener('transitionend', () => this.isTransiting = false);
      }

      /*
        Infinite looping을 위해 캐러셀 리스트의 처음과 마지막에
        캐러셀 아이템의 첫번째, 마지막 요소를 클론하여 삽입한다.
       */
      insertClone() {
        const firstItem = this.items[0];
        const lastItem = this.items[this.items.length - 1];

        // 참조된 노드(firstChild) 앞에 특정 부모 노드(container)의 자식 노드(clone)를 삽입
        this.container.insertBefore(lastItem.cloneNode(true), this.container.firstChild);
        this.container.appendChild(firstItem.cloneNode(true));
      }
      /*
        prev 버튼 이벤트 핸들러
        이전 슬라이더로 이동하기 위해 carousel-container 요소를 오른쪽으로 이동시킨다.
      */
      moveToPrev() {
        // 과도한 이동 요청 방지를 위해 트랜지션이 진행중인 상태라면 이동 요청을 무시한다.
        if (this.isTransiting) return;

        // carousel-container 요소를 오른쪽으로 이동시키기 위해 이동거리를 캐러셀 아이템의 너비만큼 증시킨다.
        this.offset += this.itemWidth;
        // 이전 슬라이더로 이동하기 위해 carousel-container 요소를 오른쪽으로 이동시킨다.
        this.move();
        // 현재 표시 중인 캐러셀 아이템 인덱스(0~his.itemLength+1)
        this.currentItem--;

        if (this.config.infinite) {
          if (this.isClone()) {
            // 클론 요소이면 뒤쪽에 존재하는 동일한 슬라이더로 이동한다. 이때 애니메이션 없이 이동해서 사용자에게 이동한 것을 감춘다.
            // 이동 거리는 클론 요소를 제외한 슬라이더 개수 만큼
            this.offset -= this.itemLength * this.itemWidth;
            // this.move()에 소요되는 duration을 기다린 후에 이동한다.
            setTimeout(() => this.moveWithoutAnimation(), this.config.duration);
            // this.itemLength 만큼 이동했으므로 this.currentItem에서 this.itemLength를 더한다.
            this.currentItem = this.currentItem + this.itemLength;
          }
        } else {
          // prev, next 버튼 활성화/비활성화 결정
          this.checkMovable();
        }
      }

      /*
        next 버튼 이벤트 핸들러
        다음 슬라이더로 이동하기 위해 carousel-container 요소를 왼쪽으로 이동시킨다.
      */
      moveToNext() {
        console.log(this.isTransiting)
        // 과도한 이동 요청 방지를 위해 트랜지션이 진행중인 상태라면 이동 요청을 무시한다.
        if (this.isTransiting) return;

        // carousel-container 요소를 왼쪽으로 이동시키기 위해 이동거리를 캐러셀 아이템의 너비만큼 감소시킨다.
        this.offset -= this.itemWidth;
        // 다음 슬라이더로 이동하기 위해 carousel-container 요소를 왼쪽으로 이동시킨다.
        this.move();
        // 현재 표시 중인 캐러셀 아이템 인덱스(0~his.itemLength+1)
        this.currentItem++;

        if (this.config.infinite) {
          if (this.isClone()) {
            // 클론 요소이면 앞쪽에 존재하는 동일한 슬라이더로 이동한다. 이때 애니메이션 없이 이동해서 사용자에게 이동한 것을 감춘다.
            // 이동 거리는 클론 요소를 제외한 슬라이더 개수 만큼
            this.offset += this.itemLength * this.itemWidth;
            // this.move()에 소요되는 duration을 기다린 후에 이동한다.
            setTimeout(() => this.moveWithoutAnimation(), this.config.duration);
            // this.itemLength 만큼 이동했으므로 this.currentItem에서 this.itemLength를 뺀다.
            this.currentItem = this.currentItem - this.itemLength;
          }
        } else {
          // prev, next 버튼 활성화/비활성화 결정
          this.checkMovable();
        }
      }

      /*
        클론 요소인지 판별한다.
        this.currentItem은 0~this.itemLength + 1 사이의 정수
        this.currentItem이 0이면 첫번째 클론 요소
        this.currentItem이 this.itemLength + 1이면 마지막 클론 요소
      */
      isClone() {
        return this.currentItem === 0 || this.currentItem === this.itemLength + 1;
      }

      // offset 만큼 carousel-container 요소를 이동시킨다.
      move() {
        // transition 중인 상태
        this.isTransiting = true;
        this.container.style.transition = 'transform ${this.config.duration}ms ${this.config.easing}';
        this.container.style.transform = 'translate3D(${this.offset}px, 0, 0)';
      }

      // offset 만큼 carousel-container 요소를 애니메이션 없이 이동시킨다.
      moveWithoutAnimation() {
        this.container.style.transition = 'none';
        this.container.style.transform = 'translate3D(${this.offset}px, 0, 0)';
      }

      // prev, next 버튼 활성화/비활성화 결정
      checkMovable() {
        if (this.currentItem === 1) {
          this.prev.disabled = true;
          this.prev.classList.add('disabled');
        } else {
          this.prev.disabled = false;
          this.prev.classList.remove('disabled');
        }

        if (this.currentItem === this.itemLength) {
          this.next.disabled = true;
          this.next.classList.add('disabled');
        } else {
          this.next.disabled = false;
          this.next.classList.remove('disabled');
        }
      }
    }

    window.onload = function () {
      const carousel = new Carousel();
      // const carousel = new Carousel({ infinite: false });
    };