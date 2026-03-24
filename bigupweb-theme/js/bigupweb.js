(() => {
  // src/js/bigupweb.js
  var setupSlidingHeader = () => {
    const header = document.getElementById("site-header");
    let ticking = false;
    const shrinkStart = 120;
    const expandStart = 80;
    function updateHeader() {
      const scrollY = window.scrollY;
      if (scrollY > shrinkStart && !header.classList.contains("header-scrolled")) {
        header.classList.add("header-scrolled");
      }
      if (scrollY < expandStart && header.classList.contains("header-scrolled")) {
        header.classList.remove("header-scrolled");
      }
      ticking = false;
    }
    window.addEventListener("scroll", () => {
      if (!ticking) {
        requestAnimationFrame(updateHeader);
        ticking = true;
      }
    });
  };
  var setupdrawerMenu = () => {
    const drawer = document.getElementById("drawerMenu");
    const overlay = document.getElementById("drawerMenu_overlay");
    const toggle = document.getElementById("drawerMenu_toggle");
    const closeBtn = document.getElementById("drawerMenu_close");
    let startX = 0;
    let currentX = 0;
    let touching = false;
    if (!drawer) {
      return;
    }
    function openDrawer() {
      drawer.classList.add("open");
      overlay.classList.add("active");
      toggle.classList.add("active");
      document.body.classList.add("drawerMenu-open");
    }
    function closeDrawer() {
      drawer.classList.remove("open");
      overlay.classList.remove("active");
      toggle.classList.remove("active");
      document.body.classList.remove("drawerMenu-open");
    }
    if (toggle) {
      toggle.addEventListener("click", () => {
        if (drawer.classList.contains("open")) {
          closeDrawer();
        } else {
          openDrawer();
        }
      });
    }
    if (overlay) {
      overlay.addEventListener("click", closeDrawer);
    }
    if (closeBtn) {
      closeBtn.addEventListener("click", closeDrawer);
    }
    document.querySelectorAll("#drawerMenu a").forEach((link) => {
      if (!link.classList.contains("submenu-toggle")) {
        link.addEventListener("click", closeDrawer);
      }
    });
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        closeDrawer();
      }
    });
    document.addEventListener("touchstart", (e) => {
      startX = e.touches[0].clientX;
      touching = true;
    });
    document.addEventListener("touchmove", (e) => {
      if (!touching)
        return;
      currentX = e.touches[0].clientX;
      const deltaX = currentX - startX;
      if (startX < 120 && deltaX > 70) {
        openDrawer();
        touching = false;
      }
      if (drawer.classList.contains("open") && deltaX < -70) {
        closeDrawer();
        touching = false;
      }
    });
    document.addEventListener("touchend", () => {
      touching = false;
    });
    document.querySelectorAll("#drawerMenu li").forEach((item) => {
      const submenu = item.querySelector("ul");
      if (submenu) {
        item.querySelector("a").addEventListener("click", (e) => {
          e.preventDefault();
          item.classList.toggle("open");
        });
      }
    });
  };
  window.onload = () => {
    setupSlidingHeader();
    setupdrawerMenu();
  };
})();
