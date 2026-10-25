import sys
from PySide6.QtWidgets import QApplication
from screentext.main_window import ScreenTextWindow

def main():
    app = QApplication(sys.argv)
    app.setApplicationName("ScreenText")
    window = ScreenTextWindow()
    window.show()
    return app.exec()

if __name__ == "__main__":
    raise SystemExit(main())
