/**
 * Sliding Header.
 */
const setupSlidingHeader = () => {
  const header = document.getElementById('site-header')

  let ticking = false

  const shrinkStart = 120
  const expandStart = 80

  function updateHeader () {
    const scrollY = window.scrollY

    if (
      scrollY > shrinkStart &&
      !header.classList.contains('header-scrolled')
    ) {
      header.classList.add('header-scrolled')
    }

    if (scrollY < expandStart && header.classList.contains('header-scrolled')) {
      header.classList.remove('header-scrolled')
    }

    ticking = false
  }

  window.addEventListener('scroll', () => {
    if (!ticking) {
      requestAnimationFrame(updateHeader)
      ticking = true
    }
  })
}

/**
 * Mobile Drawer Menu.
 */
const setupdrawerMenu = () => {
  const drawer   = document.getElementById('drawerMenu')
  const overlay  = document.getElementById('drawerMenu_overlay')
  const toggle   = document.getElementById('drawerMenu_toggle')
  const closeBtn = document.getElementById('drawerMenu_close')

  let startX = 0
  let currentX = 0
  let touching = false

  if (!drawer) {
    return
  }

  function openDrawer () {
    drawer.classList.add('open')
    overlay.classList.add('active')
    toggle.classList.add('active')
    document.body.classList.add('drawerMenu-open')
  }

  function closeDrawer () {
    drawer.classList.remove('open')
    overlay.classList.remove('active')
    toggle.classList.remove('active')
    document.body.classList.remove('drawerMenu-open')
  }

  /* Burger button */

  if (toggle) {
    toggle.addEventListener('click', () => {
      if (drawer.classList.contains('open')) {
        closeDrawer()
      } else {
        openDrawer()
      }
    })
  }

  /* Overlay click */

  if (overlay) {
    overlay.addEventListener('click', closeDrawer)
  }

  /* Drawer close button */

  if (closeBtn) {
    closeBtn.addEventListener('click', closeDrawer)
  }

  /* Close on link click */

  document.querySelectorAll('#drawerMenu a').forEach(link => {
    if (!link.classList.contains('submenu-toggle')) {
      link.addEventListener('click', closeDrawer)
    }
  })

  /* Close on escape key press */

  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') {
      closeDrawer()
    }
  })

  /* Touch start */

  document.addEventListener('touchstart', e => {
    startX = e.touches[0].clientX
    touching = true
  })

  /* Touch move */

  document.addEventListener('touchmove', e => {
    if (!touching) return

    currentX = e.touches[0].clientX
    const deltaX = currentX - startX

    /* swipe right from screen edge to open */

    if (startX < 120 && deltaX > 70) {
      openDrawer()
      touching = false
    }

    /* swipe left to close */

    if (drawer.classList.contains('open') && deltaX < -70) {
      closeDrawer()
      touching = false
    }
  })

  /* Touch end */

  document.addEventListener('touchend', () => {
    touching = false
  })

  /* Accordion sub-menus */

  document.querySelectorAll('#drawerMenu li').forEach(item => {
    const submenu = item.querySelector('ul')

    if (submenu) {
      item.querySelector('a').addEventListener('click', e => {
        e.preventDefault()
        item.classList.toggle('open')
      })
    }
  })
}

const animateMobileToggle = () => {
  document
    .getElementById('drawerMenu_toggle')
    .addEventListener('click', function () {
      this.classList.toggle('active')
    })
}

window.onload = () => {
  setupSlidingHeader()
  setupdrawerMenu()
}
