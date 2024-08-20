<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <style type="text/css">body.swal2-shown:not(.swal2-no-backdrop) {
            overflow-y: hidden;
        }

        body.swal2-toast-shown {
            overflow-y: auto;
        }

        body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast {
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
        }

        body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-icon {
            margin: 0 0 15px;
        }

        body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-buttonswrapper {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            -ms-flex-item-align: stretch;
            align-self: stretch;
            -webkit-box-pack: end;
            -ms-flex-pack: end;
            justify-content: flex-end;
        }

        body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-loading {
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

        body.swal2-toast-shown.swal2-has-input > .swal2-container > .swal2-toast .swal2-input {
            height: 32px;
            font-size: 14px;
            margin: 5px auto;
        }

        body.swal2-toast-shown > .swal2-container {
            position: fixed;
            background-color: transparent;
        }

        body.swal2-toast-shown > .swal2-container.swal2-shown {
            background-color: transparent;
        }

        body.swal2-toast-shown > .swal2-container.swal2-top {
            top: 0;
            left: 50%;
            bottom: auto;
            right: auto;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
        }

        body.swal2-toast-shown > .swal2-container.swal2-top-right {
            top: 0;
            left: auto;
            bottom: auto;
            right: 0;
        }

        body.swal2-toast-shown > .swal2-container.swal2-top-left {
            top: 0;
            left: 0;
            bottom: auto;
            right: auto;
        }

        body.swal2-toast-shown > .swal2-container.swal2-center-left {
            top: 50%;
            left: 0;
            bottom: auto;
            right: auto;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        body.swal2-toast-shown > .swal2-container.swal2-center {
            top: 50%;
            left: 50%;
            bottom: auto;
            right: auto;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        body.swal2-toast-shown > .swal2-container.swal2-center-right {
            top: 50%;
            left: auto;
            bottom: auto;
            right: 0;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        body.swal2-toast-shown > .swal2-container.swal2-bottom-left {
            top: auto;
            left: 0;
            bottom: 0;
            right: auto;
        }

        body.swal2-toast-shown > .swal2-container.swal2-bottom {
            top: auto;
            left: 50%;
            bottom: 0;
            right: auto;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
        }

        body.swal2-toast-shown > .swal2-container.swal2-bottom-right {
            top: auto;
            left: auto;
            bottom: 0;
            right: 0;
        }

        body.swal2-iosfix {
            position: fixed;
            left: 0;
            right: 0;
        }

        body.swal2-no-backdrop > .swal2-shown {
            top: auto;
            bottom: auto;
            left: auto;
            right: auto;
            background-color: transparent;
        }

        body.swal2-no-backdrop > .swal2-shown > .swal2-modal {
            -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-top {
            top: 0;
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-top-left {
            top: 0;
            left: 0;
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-top-right {
            top: 0;
            right: 0;
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-center {
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-center-left {
            top: 50%;
            left: 0;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-center-right {
            top: 50%;
            right: 0;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-bottom {
            bottom: 0;
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-bottom-left {
            bottom: 0;
            left: 0;
        }

        body.swal2-no-backdrop > .swal2-shown.swal2-bottom-right {
            bottom: 0;
            right: 0;
        }

        .swal2-container {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-direction: row;
            flex-direction: row;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            position: fixed;
            padding: 10px;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: transparent;
            z-index: 1060;
        }

        .swal2-container.swal2-top {
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
        }

        .swal2-container.swal2-top-left {
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
            -webkit-box-pack: start;
            -ms-flex-pack: start;
            justify-content: flex-start;
        }

        .swal2-container.swal2-top-right {
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
            -webkit-box-pack: end;
            -ms-flex-pack: end;
            justify-content: flex-end;
        }

        .swal2-container.swal2-center {
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }

        .swal2-container.swal2-center-left {
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: start;
            -ms-flex-pack: start;
            justify-content: flex-start;
        }

        .swal2-container.swal2-center-right {
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: end;
            -ms-flex-pack: end;
            justify-content: flex-end;
        }

        .swal2-container.swal2-bottom {
            -webkit-box-align: end;
            -ms-flex-align: end;
            align-items: flex-end;
        }

        .swal2-container.swal2-bottom-left {
            -webkit-box-align: end;
            -ms-flex-align: end;
            align-items: flex-end;
            -webkit-box-pack: start;
            -ms-flex-pack: start;
            justify-content: flex-start;
        }

        .swal2-container.swal2-bottom-right {
            -webkit-box-align: end;
            -ms-flex-align: end;
            align-items: flex-end;
            -webkit-box-pack: end;
            -ms-flex-pack: end;
            justify-content: flex-end;
        }

        .swal2-container.swal2-grow-fullscreen > .swal2-modal {
            display: -webkit-box !important;
            display: -ms-flexbox !important;
            display: flex !important;
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            -ms-flex-item-align: stretch;
            align-self: stretch;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

        .swal2-container.swal2-grow-row > .swal2-modal {
            display: -webkit-box !important;
            display: -ms-flexbox !important;
            display: flex !important;
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            -ms-flex-line-pack: center;
            align-content: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

        .swal2-container.swal2-grow-column {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
        }

        .swal2-container.swal2-grow-column.swal2-top, .swal2-container.swal2-grow-column.swal2-center, .swal2-container.swal2-grow-column.swal2-bottom {
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }

        .swal2-container.swal2-grow-column.swal2-top-left, .swal2-container.swal2-grow-column.swal2-center-left, .swal2-container.swal2-grow-column.swal2-bottom-left {
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
        }

        .swal2-container.swal2-grow-column.swal2-top-right, .swal2-container.swal2-grow-column.swal2-center-right, .swal2-container.swal2-grow-column.swal2-bottom-right {
            -webkit-box-align: end;
            -ms-flex-align: end;
            align-items: flex-end;
        }

        .swal2-container.swal2-grow-column > .swal2-modal {
            display: -webkit-box !important;
            display: -ms-flexbox !important;
            display: flex !important;
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            -ms-flex-line-pack: center;
            align-content: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

        .swal2-container:not(.swal2-top):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-left):not(.swal2-bottom-right) > .swal2-modal {
            margin: auto;
        }

        @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
            .swal2-container .swal2-modal {
                margin: 0 !important;
            }
        }

        .swal2-container.swal2-fade {
            -webkit-transition: background-color .1s;
            transition: background-color .1s;
        }

        .swal2-container.swal2-shown {
            background-color: rgba(0, 0, 0, 0.4);
        }

        .swal2-popup {
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            background-color: #fff;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            border-radius: 5px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            text-align: center;
            overflow-x: hidden;
            overflow-y: auto;
            display: none;
            position: relative;
            max-width: 100%;
        }

        .swal2-popup.swal2-toast {
            width: 300px;
            padding: 0 15px;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-direction: row;
            flex-direction: row;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            overflow-y: hidden;
            -webkit-box-shadow: 0 0 10px #d9d9d9;
            box-shadow: 0 0 10px #d9d9d9;
        }

        .swal2-popup.swal2-toast .swal2-title {
            max-width: 300px;
            font-size: 16px;
            text-align: left;
        }

        .swal2-popup.swal2-toast .swal2-content {
            font-size: 14px;
            text-align: left;
        }

        .swal2-popup.swal2-toast .swal2-icon {
            width: 32px;
            height: 32px;
            margin: 0 15px 0 0;
        }

        .swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring {
            width: 32px;
            height: 32px;
        }

        .swal2-popup.swal2-toast .swal2-icon.swal2-info, .swal2-popup.swal2-toast .swal2-icon.swal2-warning, .swal2-popup.swal2-toast .swal2-icon.swal2-question {
            font-size: 26px;
            line-height: 32px;
        }

        .swal2-popup.swal2-toast .swal2-icon.swal2-error [class^='swal2-x-mark-line'] {
            top: 14px;
            width: 22px;
        }

        .swal2-popup.swal2-toast .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='left'] {
            left: 5px;
        }

        .swal2-popup.swal2-toast .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='right'] {
            right: 5px;
        }

        .swal2-popup.swal2-toast .swal2-buttonswrapper {
            margin: 0 0 0 5px;
        }

        .swal2-popup.swal2-toast .swal2-styled {
            margin: 0 0 0 5px;
            padding: 5px 10px;
        }

        .swal2-popup.swal2-toast .swal2-styled:focus {
            -webkit-box-shadow: 0 0 0 1px #fff, 0 0 0 2px rgba(50, 100, 150, 0.4);
            box-shadow: 0 0 0 1px #fff, 0 0 0 2px rgba(50, 100, 150, 0.4);
        }

        .swal2-popup.swal2-toast .swal2-validationerror {
            width: 100%;
            margin: 5px -20px;
        }

        .swal2-popup.swal2-toast .swal2-success {
            border-color: #a5dc86;
        }

        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-circular-line'] {
            border-radius: 50%;
            position: absolute;
            width: 32px;
            height: 64px;
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
        }

        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-circular-line'][class$='left'] {
            border-radius: 64px 0 0 64px;
            top: -4px;
            left: -15px;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
            -webkit-transform-origin: 32px 32px;
            transform-origin: 32px 32px;
        }

        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-circular-line'][class$='right'] {
            border-radius: 0 64px 64px 0;
            top: -5px;
            left: 14px;
            -webkit-transform-origin: 0 32px;
            transform-origin: 0 32px;
        }

        .swal2-popup.swal2-toast .swal2-success .swal2-success-ring {
            width: 32px;
            height: 32px;
        }

        .swal2-popup.swal2-toast .swal2-success .swal2-success-fix {
            width: 7px;
            height: 90px;
            left: 28px;
            top: 8px;
        }

        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-line'] {
            height: 5px;
        }

        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-line'][class$='tip'] {
            width: 12px;
            left: 3px;
            top: 18px;
        }

        .swal2-popup.swal2-toast .swal2-success [class^='swal2-success-line'][class$='long'] {
            width: 22px;
            right: 3px;
            top: 15px;
        }

        .swal2-popup.swal2-toast .swal2-animate-success-line-tip {
            -webkit-animation: animate-toast-success-tip .75s;
            animation: animate-toast-success-tip .75s;
        }

        .swal2-popup.swal2-toast .swal2-animate-success-line-long {
            -webkit-animation: animate-toast-success-long .75s;
            animation: animate-toast-success-long .75s;
        }

        .swal2-popup:focus {
            outline: none;
        }

        .swal2-popup.swal2-loading {
            overflow-y: hidden;
        }

        .swal2-popup .swal2-title {
            color: #595959;
            font-size: 30px;
            text-align: center;
            font-weight: 600;
            text-transform: none;
            position: relative;
            margin: 0 0 .4em;
            padding: 0;
            display: block;
            word-wrap: break-word;
        }

        .swal2-popup .swal2-buttonswrapper {
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            margin-top: 15px;
        }

        .swal2-popup .swal2-buttonswrapper:not(.swal2-loading) .swal2-styled[disabled] {
            opacity: .4;
            cursor: no-drop;
        }

        .swal2-popup .swal2-buttonswrapper.swal2-loading .swal2-styled.swal2-confirm {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border: 4px solid transparent;
            border-color: transparent;
            width: 40px;
            height: 40px;
            padding: 0;
            margin: 7.5px;
            vertical-align: top;
            background-color: transparent !important;
            color: transparent;
            cursor: default;
            border-radius: 100%;
            -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
            animation: rotate-loading 1.5s linear 0s infinite normal;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .swal2-popup .swal2-buttonswrapper.swal2-loading .swal2-styled.swal2-cancel {
            margin-left: 30px;
            margin-right: 30px;
        }

        .swal2-popup .swal2-buttonswrapper.swal2-loading :not(.swal2-styled).swal2-confirm::after {
            display: inline-block;
            content: '';
            margin-left: 5px;
            vertical-align: -1px;
            height: 15px;
            width: 15px;
            border: 3px solid #999999;
            -webkit-box-shadow: 1px 1px 1px #fff;
            box-shadow: 1px 1px 1px #fff;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
            animation: rotate-loading 1.5s linear 0s infinite normal;
        }

        .swal2-popup .swal2-styled {
            border: 0;
            border-radius: 3px;
            -webkit-box-shadow: none;
            box-shadow: none;
            color: #fff;
            cursor: pointer;
            font-size: 17px;
            font-weight: 500;
            margin: 15px 5px 0;
            padding: 10px 32px;
        }

        .swal2-popup .swal2-styled:focus {
            outline: none;
            -webkit-box-shadow: 0 0 0 2px #fff, 0 0 0 4px rgba(50, 100, 150, 0.4);
            box-shadow: 0 0 0 2px #fff, 0 0 0 4px rgba(50, 100, 150, 0.4);
        }

        .swal2-popup .swal2-image {
            margin: 20px auto;
            max-width: 100%;
        }

        .swal2-popup .swal2-close {
            background: transparent;
            border: 0;
            margin: 0;
            padding: 0;
            width: 38px;
            height: 40px;
            font-size: 36px;
            line-height: 40px;
            font-family: serif;
            position: absolute;
            top: 5px;
            right: 8px;
            cursor: pointer;
            color: #cccccc;
            -webkit-transition: color .1s ease;
            transition: color .1s ease;
        }

        .swal2-popup .swal2-close:hover {
            color: #d55;
        }

        .swal2-popup > .swal2-input,
        .swal2-popup > .swal2-file,
        .swal2-popup > .swal2-textarea,
        .swal2-popup > .swal2-select,
        .swal2-popup > .swal2-radio,
        .swal2-popup > .swal2-checkbox {
            display: none;
        }

        .swal2-popup .swal2-content {
            font-size: 18px;
            text-align: center;
            font-weight: 300;
            position: relative;
            float: none;
            margin: 0;
            padding: 0;
            line-height: normal;
            color: #545454;
            word-wrap: break-word;
        }

        .swal2-popup .swal2-input,
        .swal2-popup .swal2-file,
        .swal2-popup .swal2-textarea,
        .swal2-popup .swal2-select,
        .swal2-popup .swal2-radio,
        .swal2-popup .swal2-checkbox {
            margin: 20px auto;
        }

        .swal2-popup .swal2-input,
        .swal2-popup .swal2-file,
        .swal2-popup .swal2-textarea {
            width: 100%;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 18px;
            border-radius: 3px;
            border: 1px solid #d9d9d9;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.06);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.06);
            -webkit-transition: border-color .3s, -webkit-box-shadow .3s;
            transition: border-color .3s, -webkit-box-shadow .3s;
            transition: border-color .3s, box-shadow .3s;
            transition: border-color .3s, box-shadow .3s, -webkit-box-shadow .3s;
        }

        .swal2-popup .swal2-input.swal2-inputerror,
        .swal2-popup .swal2-file.swal2-inputerror,
        .swal2-popup .swal2-textarea.swal2-inputerror {
            border-color: #f27474 !important;
            -webkit-box-shadow: 0 0 2px #f27474 !important;
            box-shadow: 0 0 2px #f27474 !important;
        }

        .swal2-popup .swal2-input:focus,
        .swal2-popup .swal2-file:focus,
        .swal2-popup .swal2-textarea:focus {
            outline: none;
            border: 1px solid #b4dbed;
            -webkit-box-shadow: 0 0 3px #c4e6f5;
            box-shadow: 0 0 3px #c4e6f5;
        }

        .swal2-popup .swal2-input::-webkit-input-placeholder,
        .swal2-popup .swal2-file::-webkit-input-placeholder,
        .swal2-popup .swal2-textarea::-webkit-input-placeholder {
            color: #cccccc;
        }

        .swal2-popup .swal2-input:-ms-input-placeholder,
        .swal2-popup .swal2-file:-ms-input-placeholder,
        .swal2-popup .swal2-textarea:-ms-input-placeholder {
            color: #cccccc;
        }

        .swal2-popup .swal2-input::-ms-input-placeholder,
        .swal2-popup .swal2-file::-ms-input-placeholder,
        .swal2-popup .swal2-textarea::-ms-input-placeholder {
            color: #cccccc;
        }

        .swal2-popup .swal2-input::placeholder,
        .swal2-popup .swal2-file::placeholder,
        .swal2-popup .swal2-textarea::placeholder {
            color: #cccccc;
        }

        .swal2-popup .swal2-range input {
            float: left;
            width: 80%;
        }

        .swal2-popup .swal2-range output {
            float: right;
            width: 20%;
            font-size: 20px;
            font-weight: 600;
            text-align: center;
        }

        .swal2-popup .swal2-range input,
        .swal2-popup .swal2-range output {
            height: 43px;
            line-height: 43px;
            vertical-align: middle;
            margin: 20px auto;
            padding: 0;
        }

        .swal2-popup .swal2-input {
            height: 43px;
            padding: 0 12px;
        }

        .swal2-popup .swal2-input[type='number'] {
            max-width: 150px;
        }

        .swal2-popup .swal2-file {
            font-size: 20px;
        }

        .swal2-popup .swal2-textarea {
            height: 108px;
            padding: 12px;
        }

        .swal2-popup .swal2-select {
            color: #545454;
            font-size: inherit;
            padding: 5px 10px;
            min-width: 40%;
            max-width: 100%;
        }

        .swal2-popup .swal2-radio {
            border: 0;
        }

        .swal2-popup .swal2-radio label:not(:first-child) {
            margin-left: 20px;
        }

        .swal2-popup .swal2-radio input,
        .swal2-popup .swal2-radio span {
            vertical-align: middle;
        }

        .swal2-popup .swal2-radio input {
            margin: 0 3px 0 0;
        }

        .swal2-popup .swal2-checkbox {
            color: #545454;
        }

        .swal2-popup .swal2-checkbox input,
        .swal2-popup .swal2-checkbox span {
            vertical-align: middle;
        }

        .swal2-popup .swal2-validationerror {
            background-color: #f0f0f0;
            margin: 0 -20px;
            overflow: hidden;
            padding: 10px;
            color: gray;
            font-size: 16px;
            font-weight: 300;
            display: none;
        }

        .swal2-popup .swal2-validationerror::before {
            content: '!';
            display: inline-block;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background-color: #ea7d7d;
            color: #fff;
            line-height: 24px;
            text-align: center;
            margin-right: 10px;
        }

        @supports (-ms-accelerator: true) {
            .swal2-range input {
                width: 100% !important;
            }

            .swal2-range output {
                display: none;
            }
        }

        @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
            .swal2-range input {
                width: 100% !important;
            }

            .swal2-range output {
                display: none;
            }
        }

        .swal2-icon {
            width: 80px;
            height: 80px;
            border: 4px solid transparent;
            border-radius: 50%;
            margin: 20px auto 30px;
            padding: 0;
            position: relative;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
            cursor: default;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .swal2-icon.swal2-error {
            border-color: #f27474;
        }

        .swal2-icon.swal2-error .swal2-x-mark {
            position: relative;
            display: block;
        }

        .swal2-icon.swal2-error [class^='swal2-x-mark-line'] {
            position: absolute;
            height: 5px;
            width: 47px;
            background-color: #f27474;
            display: block;
            top: 37px;
            border-radius: 2px;
        }

        .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='left'] {
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
            left: 17px;
        }

        .swal2-icon.swal2-error [class^='swal2-x-mark-line'][class$='right'] {
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
            right: 16px;
        }

        .swal2-icon.swal2-warning {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            color: #f8bb86;
            border-color: #facea8;
            font-size: 60px;
            line-height: 80px;
            text-align: center;
        }

        .swal2-icon.swal2-info {
            font-family: 'Open Sans', sans-serif;
            color: #3fc3ee;
            border-color: #9de0f6;
            font-size: 60px;
            line-height: 80px;
            text-align: center;
        }

        .swal2-icon.swal2-question {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            color: #87adbd;
            border-color: #c9dae1;
            font-size: 60px;
            line-height: 80px;
            text-align: center;
        }

        .swal2-icon.swal2-success {
            border-color: #a5dc86;
        }

        .swal2-icon.swal2-success [class^='swal2-success-circular-line'] {
            border-radius: 50%;
            position: absolute;
            width: 60px;
            height: 120px;
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
        }

        .swal2-icon.swal2-success [class^='swal2-success-circular-line'][class$='left'] {
            border-radius: 120px 0 0 120px;
            top: -7px;
            left: -33px;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
            -webkit-transform-origin: 60px 60px;
            transform-origin: 60px 60px;
        }

        .swal2-icon.swal2-success [class^='swal2-success-circular-line'][class$='right'] {
            border-radius: 0 120px 120px 0;
            top: -11px;
            left: 30px;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
            -webkit-transform-origin: 0 60px;
            transform-origin: 0 60px;
        }

        .swal2-icon.swal2-success .swal2-success-ring {
            width: 80px;
            height: 80px;
            border: 4px solid rgba(165, 220, 134, 0.2);
            border-radius: 50%;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
            position: absolute;
            left: -4px;
            top: -4px;
            z-index: 2;
        }

        .swal2-icon.swal2-success .swal2-success-fix {
            width: 7px;
            height: 90px;
            position: absolute;
            left: 28px;
            top: 8px;
            z-index: 1;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .swal2-icon.swal2-success [class^='swal2-success-line'] {
            height: 5px;
            background-color: #a5dc86;
            display: block;
            border-radius: 2px;
            position: absolute;
            z-index: 2;
        }

        .swal2-icon.swal2-success [class^='swal2-success-line'][class$='tip'] {
            width: 25px;
            left: 14px;
            top: 46px;
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
        }

        .swal2-icon.swal2-success [class^='swal2-success-line'][class$='long'] {
            width: 47px;
            right: 8px;
            top: 38px;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .swal2-progresssteps {
            font-weight: 600;
            margin: 0 0 20px;
            padding: 0;
        }

        .swal2-progresssteps li {
            display: inline-block;
            position: relative;
        }

        .swal2-progresssteps .swal2-progresscircle {
            background: #3085d6;
            border-radius: 2em;
            color: #fff;
            height: 2em;
            line-height: 2em;
            text-align: center;
            width: 2em;
            z-index: 20;
        }

        .swal2-progresssteps .swal2-progresscircle:first-child {
            margin-left: 0;
        }

        .swal2-progresssteps .swal2-progresscircle:last-child {
            margin-right: 0;
        }

        .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep {
            background: #3085d6;
        }

        .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep ~ .swal2-progresscircle {
            background: #add8e6;
        }

        .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep ~ .swal2-progressline {
            background: #add8e6;
        }

        .swal2-progresssteps .swal2-progressline {
            background: #3085d6;
            height: .4em;
            margin: 0 -1px;
            z-index: 10;
        }

        [class^='swal2'] {
            -webkit-tap-highlight-color: transparent;
        }

        @-webkit-keyframes showSweetToast {
            0% {
                -webkit-transform: translateY(-10px) rotateZ(2deg);
                transform: translateY(-10px) rotateZ(2deg);
                opacity: 0;
            }
            33% {
                -webkit-transform: translateY(0) rotateZ(-2deg);
                transform: translateY(0) rotateZ(-2deg);
                opacity: .5;
            }
            66% {
                -webkit-transform: translateY(5px) rotateZ(2deg);
                transform: translateY(5px) rotateZ(2deg);
                opacity: .7;
            }
            100% {
                -webkit-transform: translateY(0) rotateZ(0);
                transform: translateY(0) rotateZ(0);
                opacity: 1;
            }
        }

        @keyframes showSweetToast {
            0% {
                -webkit-transform: translateY(-10px) rotateZ(2deg);
                transform: translateY(-10px) rotateZ(2deg);
                opacity: 0;
            }
            33% {
                -webkit-transform: translateY(0) rotateZ(-2deg);
                transform: translateY(0) rotateZ(-2deg);
                opacity: .5;
            }
            66% {
                -webkit-transform: translateY(5px) rotateZ(2deg);
                transform: translateY(5px) rotateZ(2deg);
                opacity: .7;
            }
            100% {
                -webkit-transform: translateY(0) rotateZ(0);
                transform: translateY(0) rotateZ(0);
                opacity: 1;
            }
        }

        @-webkit-keyframes hideSweetToast {
            0% {
                opacity: 1;
            }
            33% {
                opacity: .5;
            }
            100% {
                -webkit-transform: rotateZ(1deg);
                transform: rotateZ(1deg);
                opacity: 0;
            }
        }

        @keyframes hideSweetToast {
            0% {
                opacity: 1;
            }
            33% {
                opacity: .5;
            }
            100% {
                -webkit-transform: rotateZ(1deg);
                transform: rotateZ(1deg);
                opacity: 0;
            }
        }

        @-webkit-keyframes showSweetAlert {
            0% {
                -webkit-transform: scale(0.7);
                transform: scale(0.7);
            }
            45% {
                -webkit-transform: scale(1.05);
                transform: scale(1.05);
            }
            80% {
                -webkit-transform: scale(0.95);
                transform: scale(0.95);
            }
            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes showSweetAlert {
            0% {
                -webkit-transform: scale(0.7);
                transform: scale(0.7);
            }
            45% {
                -webkit-transform: scale(1.05);
                transform: scale(1.05);
            }
            80% {
                -webkit-transform: scale(0.95);
                transform: scale(0.95);
            }
            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @-webkit-keyframes hideSweetAlert {
            0% {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
            }
            100% {
                -webkit-transform: scale(0.5);
                transform: scale(0.5);
                opacity: 0;
            }
        }

        @keyframes hideSweetAlert {
            0% {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
            }
            100% {
                -webkit-transform: scale(0.5);
                transform: scale(0.5);
                opacity: 0;
            }
        }

        .swal2-show {
            -webkit-animation: showSweetAlert .3s;
            animation: showSweetAlert .3s;
        }

        .swal2-show.swal2-toast {
            -webkit-animation: showSweetToast .5s;
            animation: showSweetToast .5s;
        }

        .swal2-show.swal2-noanimation {
            -webkit-animation: none;
            animation: none;
        }

        .swal2-hide {
            -webkit-animation: hideSweetAlert .15s forwards;
            animation: hideSweetAlert .15s forwards;
        }

        .swal2-hide.swal2-toast {
            -webkit-animation: hideSweetToast .2s forwards;
            animation: hideSweetToast .2s forwards;
        }

        .swal2-hide.swal2-noanimation {
            -webkit-animation: none;
            animation: none;
        }

        @-webkit-keyframes animate-success-tip {
            0% {
                width: 0;
                left: 1px;
                top: 19px;
            }
            54% {
                width: 0;
                left: 1px;
                top: 19px;
            }
            70% {
                width: 50px;
                left: -8px;
                top: 37px;
            }
            84% {
                width: 17px;
                left: 21px;
                top: 48px;
            }
            100% {
                width: 25px;
                left: 14px;
                top: 45px;
            }
        }

        @keyframes animate-success-tip {
            0% {
                width: 0;
                left: 1px;
                top: 19px;
            }
            54% {
                width: 0;
                left: 1px;
                top: 19px;
            }
            70% {
                width: 50px;
                left: -8px;
                top: 37px;
            }
            84% {
                width: 17px;
                left: 21px;
                top: 48px;
            }
            100% {
                width: 25px;
                left: 14px;
                top: 45px;
            }
        }

        @-webkit-keyframes animate-success-long {
            0% {
                width: 0;
                right: 46px;
                top: 54px;
            }
            65% {
                width: 0;
                right: 46px;
                top: 54px;
            }
            84% {
                width: 55px;
                right: 0;
                top: 35px;
            }
            100% {
                width: 47px;
                right: 8px;
                top: 38px;
            }
        }

        @keyframes animate-success-long {
            0% {
                width: 0;
                right: 46px;
                top: 54px;
            }
            65% {
                width: 0;
                right: 46px;
                top: 54px;
            }
            84% {
                width: 55px;
                right: 0;
                top: 35px;
            }
            100% {
                width: 47px;
                right: 8px;
                top: 38px;
            }
        }

        @-webkit-keyframes animate-toast-success-tip {
            0% {
                width: 0;
                left: 1px;
                top: 9px;
            }
            54% {
                width: 0;
                left: 1px;
                top: 9px;
            }
            70% {
                width: 24px;
                left: -4px;
                top: 17px;
            }
            84% {
                width: 8px;
                left: 10px;
                top: 20px;
            }
            100% {
                width: 12px;
                left: 3px;
                top: 18px;
            }
        }

        @keyframes animate-toast-success-tip {
            0% {
                width: 0;
                left: 1px;
                top: 9px;
            }
            54% {
                width: 0;
                left: 1px;
                top: 9px;
            }
            70% {
                width: 24px;
                left: -4px;
                top: 17px;
            }
            84% {
                width: 8px;
                left: 10px;
                top: 20px;
            }
            100% {
                width: 12px;
                left: 3px;
                top: 18px;
            }
        }

        @-webkit-keyframes animate-toast-success-long {
            0% {
                width: 0;
                right: 22px;
                top: 26px;
            }
            65% {
                width: 0;
                right: 22px;
                top: 26px;
            }
            84% {
                width: 26px;
                right: 0;
                top: 15px;
            }
            100% {
                width: 22px;
                right: 3px;
                top: 15px;
            }
        }

        @keyframes animate-toast-success-long {
            0% {
                width: 0;
                right: 22px;
                top: 26px;
            }
            65% {
                width: 0;
                right: 22px;
                top: 26px;
            }
            84% {
                width: 26px;
                right: 0;
                top: 15px;
            }
            100% {
                width: 22px;
                right: 3px;
                top: 15px;
            }
        }

        @-webkit-keyframes rotatePlaceholder {
            0% {
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            5% {
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            12% {
                -webkit-transform: rotate(-405deg);
                transform: rotate(-405deg);
            }
            100% {
                -webkit-transform: rotate(-405deg);
                transform: rotate(-405deg);
            }
        }

        @keyframes rotatePlaceholder {
            0% {
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            5% {
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            12% {
                -webkit-transform: rotate(-405deg);
                transform: rotate(-405deg);
            }
            100% {
                -webkit-transform: rotate(-405deg);
                transform: rotate(-405deg);
            }
        }

        .swal2-animate-success-line-tip {
            -webkit-animation: animate-success-tip .75s;
            animation: animate-success-tip .75s;
        }

        .swal2-animate-success-line-long {
            -webkit-animation: animate-success-long .75s;
            animation: animate-success-long .75s;
        }

        .swal2-success.swal2-animate-success-icon .swal2-success-circular-line-right {
            -webkit-animation: rotatePlaceholder 4.25s ease-in;
            animation: rotatePlaceholder 4.25s ease-in;
        }

        @-webkit-keyframes animate-error-icon {
            0% {
                -webkit-transform: rotateX(100deg);
                transform: rotateX(100deg);
                opacity: 0;
            }
            100% {
                -webkit-transform: rotateX(0deg);
                transform: rotateX(0deg);
                opacity: 1;
            }
        }

        @keyframes animate-error-icon {
            0% {
                -webkit-transform: rotateX(100deg);
                transform: rotateX(100deg);
                opacity: 0;
            }
            100% {
                -webkit-transform: rotateX(0deg);
                transform: rotateX(0deg);
                opacity: 1;
            }
        }

        .swal2-animate-error-icon {
            -webkit-animation: animate-error-icon .5s;
            animation: animate-error-icon .5s;
        }

        @-webkit-keyframes animate-x-mark {
            0% {
                -webkit-transform: scale(0.4);
                transform: scale(0.4);
                margin-top: 26px;
                opacity: 0;
            }
            50% {
                -webkit-transform: scale(0.4);
                transform: scale(0.4);
                margin-top: 26px;
                opacity: 0;
            }
            80% {
                -webkit-transform: scale(1.15);
                transform: scale(1.15);
                margin-top: -6px;
            }
            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
                margin-top: 0;
                opacity: 1;
            }
        }

        @keyframes animate-x-mark {
            0% {
                -webkit-transform: scale(0.4);
                transform: scale(0.4);
                margin-top: 26px;
                opacity: 0;
            }
            50% {
                -webkit-transform: scale(0.4);
                transform: scale(0.4);
                margin-top: 26px;
                opacity: 0;
            }
            80% {
                -webkit-transform: scale(1.15);
                transform: scale(1.15);
                margin-top: -6px;
            }
            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
                margin-top: 0;
                opacity: 1;
            }
        }

        .swal2-animate-x-mark {
            -webkit-animation: animate-x-mark .5s;
            animation: animate-x-mark .5s;
        }

        @-webkit-keyframes rotate-loading {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

        @keyframes rotate-loading {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body marginwidth="10" marginheight="10" leftmargin="10" topmargin="0"
      style="height: 100% !important; margin: 0; padding: 0; width: 100% !important;min-width: 100%;"
      data-new-gr-c-s-check-loaded="14.1166.0" data-gr-ext-installed="" cz-shortcut-listen="true">
<br>


<meta content="width=device-width, initial-scale=1.0" name="viewport">
<style type="text/css">
    /*** BMEMBF Start ***/
    /* CMS V4 Editor Test */
    [name=bmeMainBody] {
        min-height: 1000px;
    }

    @media only screen and (max-width: 480px) {
        table.blk, table.tblText, .bmeHolder, .bmeHolder1, table.bmeMainColumn {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeImageCard table.bmeCaptionTable td.tblCell {
            padding: 0px 20px 20px 20px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeImageCard table.bmeCaptionTable.bmeCaptionTableMobileTop td.tblCell {
            padding: 20px 20px 0 20px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.bmeCaptionTable td.tblCell {
            padding: 10px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.tblGtr {
            padding-bottom: 20px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td.blk_container, .blk_parent, .bmeLeftColumn, .bmeRightColumn, .bmeColumn1, .bmeColumn2, .bmeColumn3, .bmeBody {
            display: table !important;
            max-width: 600px !important;
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.container-table, .bmeheadertext, .container-table {
            width: 95% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .mobile-footer, .mobile-footer a {
            font-size: 13px !important;
            line-height: 18px !important;
        }

        .mobile-footer {
            text-align: center !important;
        }

        table.share-tbl {
            padding-bottom: 15px;
            width: 100% !important;
        }

        table.share-tbl td {
            display: block !important;
            text-align: center !important;
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td.bmeShareTD, td.bmeSocialTD {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td.tdBoxedTextBorder {
            width: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        th.tdBoxedTextBorder {
            width: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.blk, table[name=tblText], .bmeHolder, .bmeHolder1, table[name=bmeMainColumn] {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeImageCard table.bmeCaptionTable td[name=tblCell] {
            padding: 0px 20px 20px 20px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeImageCard table.bmeCaptionTable.bmeCaptionTableMobileTop td[name=tblCell] {
            padding: 20px 20px 0 20px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.bmeCaptionTable td[name=tblCell] {
            padding: 10px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table[name=tblGtr] {
            padding-bottom: 20px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td.blk_container, .blk_parent, [name=bmeLeftColumn], [name=bmeRightColumn], [name=bmeColumn1], [name=bmeColumn2], [name=bmeColumn3], [name=bmeBody] {
            display: table !important;
            max-width: 600px !important;
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table[class=container-table], .bmeheadertext, .container-table {
            width: 95% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .mobile-footer, .mobile-footer a {
            font-size: 13px !important;
            line-height: 18px !important;
        }

        .mobile-footer {
            text-align: center !important;
        }

        table[class="share-tbl"] {
            padding-bottom: 15px;
            width: 100% !important;
        }

        table[class="share-tbl"] td {
            display: block !important;
            text-align: center !important;
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td[name=bmeShareTD], td[name=bmeSocialTD] {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td[name=tdBoxedTextBorder] {
            width: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        th[name=tdBoxedTextBorder] {
            width: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeImageCard table.bmeImageTable {
            height: auto !important;
            width: 100% !important;
            padding: 20px !important;
            clear: both;
            float: left !important;
            border-collapse: separate;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblInline table.bmeImageTable {
            height: auto !important;
            width: 100% !important;
            padding: 10px !important;
            clear: both;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblInline table.bmeCaptionTable {
            width: 100% !important;
            clear: both;
        }
    }

    @media only screen and (max-width: 480px) {
        table.bmeImageTable {
            height: auto !important;
            width: 100% !important;
            padding: 10px !important;
            clear: both;
        }
    }

    @media only screen and (max-width: 480px) {
        table.bmeCaptionTable {
            width: 100% !important;
            clear: both;
        }
    }

    @media only screen and (max-width: 480px) {
        table.bmeImageContainer {
            width: 100% !important;
            clear: both;
            float: left !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.bmeImageTable td {
            padding: 0px !important;
            height: auto;
        }
    }

    @media only screen and (max-width: 480px) {
        img.mobile-img-large {
            width: 100% !important;
            height: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        img.bmeRSSImage {
            max-width: 320px;
            height: auto !important;
        }
    }

    @media only screen and (min-width: 640px) {
        img.bmeRSSImage {
            max-width: 600px !important;
            height: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .trMargin img {
            height: 10px;
        }
    }

    @media only screen and (max-width: 480px) {
        div.bmefooter, div.bmeheader {
            display: block !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .tdPart {
            width: 100% !important;
            clear: both;
            float: left !important;
        }
    }

    @media only screen and (max-width: 480px) {
        table.blk_parent1, table.tblPart {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .tblLine {
            min-width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblCenter img {
            margin: 0 auto;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblCenter, .bmeMblCenter div, .bmeMblCenter span {
            text-align: center !important;
            text-align: -webkit-center !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeNoBr br, .bmeImageGutterRow, .bmeMblStackCenter .bmeShareItem .tdMblHide {
            display: none !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblInline table.bmeImageTable, .bmeMblInline table.bmeCaptionTable, .bmeMblInline {
            clear: none !important;
            width: 50% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblInlineHide, .bmeShareItem .trMargin {
            display: none !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblInline table.bmeImageTable img, .bmeMblShareCenter.tblContainer.mblSocialContain, .bmeMblFollowCenter.tblContainer.mblSocialContain {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblStack > .bmeShareItem {
            width: 100% !important;
            clear: both !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeShareItem {
            padding-top: 10px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .tdPart.bmeMblStackCenter, .bmeMblStackCenter .bmeFollowItemIcon {
            padding: 0px !important;
            text-align: center !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblStackCenter > .bmeShareItem {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        td.bmeMblCenter {
            border: 0 none transparent !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeLinkTable.tdPart td {
            padding-left: 0px !important;
            padding-right: 0px !important;
            border: 0px none transparent !important;
            padding-bottom: 15px !important;
            height: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .tdMblHide {
            width: 10px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeShareItemBtn {
            display: table !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblStack td {
            text-align: left !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblStack .bmeFollowItem {
            clear: both !important;
            padding-top: 10px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblStackCenter .bmeFollowItemText {
            padding-left: 5px !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .bmeMblStackCenter .bmeFollowItem {
            clear: both !important;
            align-self: center;
            float: none !important;
            padding-top: 10px;
            margin: 0 auto;
        }
    }

    @media only screen and (max-width: 480px) {
        .tdPart > table {
            width: 100% !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .tdPart > table.bmeLinkContainer {
            width: auto !important;
        }
    }

    @media only screen and (max-width: 480px) {
        .tdPart.mblStackCenter > table.bmeLinkContainer {
            width: 100% !important;
        }
    }

    .blk_parent:first-child, .blk_parent {
        float: left;
    }

    .blk_parent:last-child {
        float: right;
    }

    /*** BMEMBF END ***/

</style>
<!--[if gte mso 9]>
<xml>
    <o:OfficeDocumentSettings>
        <o:AllowPNG/>
        <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
</xml>
<![endif]-->


<img src="https://clt1672863.benchurl.com/c/o?e=17DB0A7&amp;c=19869F&amp;t=1&amp;email=NyIeD9VsXLU%3D&amp;relid=" alt=""
     border="0" style="display:none;" height="1" width="1">

<table width="100%" cellspacing="0" cellpadding="0" border="0" name="bmeMainBody" bgcolor="#dcdbff"
       style="background-color: rgb(220, 219, 255);">
    <tbody>
    <tr>
        <td width="100%" valign="top" align="center" style="border: none;">
            <table cellspacing="0" cellpadding="0" border="0" name="bmeMainColumnParentTable" width="100%">
                <tbody>
                <tr>
                    <td name="bmeMainColumnParent"
                        style="border-collapse: separate; border: none; border-radius: 0px; border-spacing: 0px; overflow: visible;">
                        <table name="bmeMainColumn" class="bmeMainColumn"
                               style="max-width: 100%; overflow: visible; border-radius: 0px; border-collapse: separate; border-spacing: 0px;"
                               cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
                            <tbody>
                            <tr>
                                <td width="100%" class="bmeHolder" valign="top" align="center"
                                    name="bmeMainContentParent"
                                    style="border: none; border-radius: 0px; border-collapse: separate; border-spacing: 0px; overflow: hidden;">
                                    <table name="bmeMainContent"
                                           style="border-radius: 0px; border-collapse: separate; border-spacing: 0px; border: 0px none transparent; overflow: visible;"
                                           width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
                                        <tbody>
                                        <tr class="flexible-section" data-columns="1" data-columns-ratio=""
                                            id="section_1">
                                            <td width="100%" class="blk_container bmeHolder bmeBody" name="bmeBody"
                                                valign="top" align="center"
                                                style="background-color: rgb(241, 241, 241); border: none;"
                                                bgcolor="#f1f1f1">
                                                <div id="dv_8" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_6" class="blk_wrapper logo_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_image">
                                                        <tbody>
                                                        <tr>
                                                            <td style="border: none;">
                                                                <table width="100%" cellspacing="0" cellpadding="0"
                                                                       border="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td align="center" class="bmeImage"
                                                                            style="border-collapse: collapse; padding: 20px; border: none;">
                                                                            <img src="https://images.benchmarkemail.com/client1672863/image15591886.png"
                                                                                 width="160"
                                                                                 style="max-width: 160px; display: block; border-radius: 0px;"
                                                                                 alt="" data-radius="0" border="0"
                                                                                 data-original-max-width="320"
                                                                                 class="keep-custom-width"
                                                                                 data-customwidth="50"></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_3" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 10px 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_2" class="blk_wrapper title_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_text" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td style="border: none;">
                                                                <table cellpadding="0" cellspacing="0" border="0"
                                                                       width="100%" class="bmeContainerRow">
                                                                    <tbody>
                                                                    <tr>
                                                                        <th class="tdPart" valign="top" align="center"
                                                                            style="border: none;">
                                                                            <table cellspacing="0" cellpadding="0"
                                                                                   border="0" width="600" name="tblText"
                                                                                   class="tblText"
                                                                                   style="float:left; background-color:transparent;"
                                                                                   align="left">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td valign="top" align="left"
                                                                                        name="tblCell" class="tblCell"
                                                                                        style="padding: 10px 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 400; color: rgb(56, 56, 56); text-align: left; word-break: break-word; border: none;">
                                                                                        <div style="line-height: 150%; text-align: center;">
                                                                                            <span style="font-size: 28px; font-family: Arial, Helvetica, sans-serif;"><strong><span
                                                                                                            style="line-height: 150%;">Welcome to Our Academy of English Learners!</span></strong></span>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </th>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_5" class="blk_wrapper img_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_image">
                                                        <tbody>
                                                        <tr>
                                                            <td style="border: none;">
                                                                <table width="100%" cellspacing="0" cellpadding="0"
                                                                       border="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td align="center" class="bmeImage"
                                                                            style="border-collapse: collapse; padding: 20px; border: none;">
                                                                            <img src="https://images.benchmarkemail.com/client1672863/image15592054.png"
                                                                                 width="204.8"
                                                                                 style="max-width: 204.8px; display: block; border-radius: 0px;"
                                                                                 alt="" data-radius="0" border="0"
                                                                                 data-original-max-width="512"
                                                                                 class="keep-custom-width"
                                                                                 data-customwidth="40"></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="section_3" class="flexible-section" data-columns="1">
                                            <td width="100%" class="blk_container bmeHolder color_bg_option"
                                                name="bmePreFooter" valign="top" align="center"
                                                style="color: rgb(56, 56, 56); border: none; background-color: rgb(255, 255, 255);"
                                                bgcolor="#ffffff">
                                                <div id="dv_17" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 10px 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_9" class="blk_wrapper p_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_boxtext" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td align="center" name="bmeBoxContainer"
                                                                style="padding: 0px 20px; border: none;">
                                                                <table cellspacing="0" cellpadding="0" width="100%"
                                                                       name="tblText" class="tblText" border="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td valign="top" align="left"
                                                                            style="padding: 20px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-size: 14px; color: rgb(56, 56, 56); border: none;  border-collapse: collapse; word-break: break-word;"
                                                                            name="tblCell" class="tblCell">
                                                                            <div style="line-height: 150%; font-size: 16px; color: #646464;">
                                                                                Dear ${name},
                                                                                <br>
                                                                                <br>
                                                                                <p style="margin-top: 0px; margin-bottom: 0px;">
                                                                                    Congratulations on your purchase of
                                                                                    the <strong>${pack}</strong> pack!
                                                                                </p>
                                                                                <p style="margin-top: 0px; margin-bottom: 0px;"></p>
                                                                                <p style="margin-top: 0px; margin-bottom: 0px;">
                                                                                    You now have access to
                                                                                    <strong>${numberCourses} </strong>lesson.
                                                                                    Get ready to dive into an exciting
                                                                                    learning experience.</p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_7" class="blk_wrapper p_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_boxtext" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td align="center" name="bmeBoxContainer"
                                                                style="padding: 0px 20px; border: none;">
                                                                <table cellspacing="0" cellpadding="0" width="100%"
                                                                       name="tblText" class="tblText" border="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td valign="top" align="left"
                                                                            style="padding: 20px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-size: 14px; color: rgb(56, 56, 56); border: none;  border-collapse: collapse; word-break: break-word;"
                                                                            name="tblCell" class="tblCell">
                                                                            <div style="line-height: 150%; font-size: 16px; color: #646464;">
                                                                                At EngFlexy, we offer personalized
                                                                                online English courses with a unique
                                                                                focus on providing fun and interactive
                                                                                classes for individuals and groups.
                                                                                Whether you are learning from the
                                                                                comfort of your home, while traveling,
                                                                                or in your own space, our platform is
                                                                                designed to make your progress fast. We
                                                                                believe in making learning a
                                                                                collaborative and enriching experience.
                                                                                As a member of our community, you will
                                                                                have access to a range of resources,
                                                                                expert tutors, and flexible learning
                                                                                options.
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_18" class="blk_wrapper cta_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_boxtext" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td align="center" name="bmeBoxContainer"
                                                                style="padding: 0px 20px; border: none;">
                                                                <table cellspacing="0" cellpadding="0" width="100%"
                                                                       name="tblText" class="tblText" border="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td valign="top" align="left"
                                                                            style="padding: 20px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-size: 14px; color: rgb(56, 56, 56); border: none;  border-collapse: collapse; word-break: break-word;"
                                                                            name="tblCell" class="tblCell">
                                                                            <div style="line-height: 150%; font-size: 16px; color: #646464;">
                                                                                Start your English learning journey with
                                                                                EngFlexy today!
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_12" class="blk_wrapper button_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_button" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td width="20" style="border: none;"></td>
                                                            <td align="center" style="border: none;">
                                                                <table class="tblContainer" cellspacing="0"
                                                                       cellpadding="0" border="0" width="100%">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td height="10" style="border: none;"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" style="border: none;">
                                                                            <table cellspacing="0" cellpadding="0"
                                                                                   border="0" class="bmeButton"
                                                                                   align="center"
                                                                                   style="border-collapse: separate;">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td style="border-radius: 49px; border: none; background-color: rgb(255, 114, 94); text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: 20px; padding: 15px 40px; font-weight: normal; word-break: break-word;"
                                                                                        class="bmeButtonText"><span
                                                                                                style="font-family: Arial, Helvetica, sans-serif; font-size: 20px; color: rgb(255, 255, 255);"><a
                                                                                                    style="color:#FFFFFF;text-decoration:none;"
                                                                                                    target="_blank"
                                                                                                    draggable="false"
                                                                                                    href="https://clt1672863.benchurl.com/c/l?u=10EC7B6D&amp;e=17DB0A7&amp;c=19869F&amp;t=1&amp;seq=1"
                                                                                                    data-link-type="web">Start learning</a></span>
                                                                                    </td>
                                                                                </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="10" style="border: none;"></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td width="20" style="border: none;"></td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_10" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_1" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px solid rgb(236, 236, 255); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_4" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 10px 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_11" class="blk_wrapper sm_container" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_social_follow" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain" align="center"
                                                                style="padding-top:15px; padding-bottom:15px; padding-left:20px; padding-right:20px;">
                                                                <table class="tblContainer mblSocialContain"
                                                                       cellspacing="0" cellpadding="0" border="0"
                                                                       align="center" style="text-align:center;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td class="tdItemContainer">
                                                                            <table cellspacing="0" cellpadding="0"
                                                                                   border="0" class="mblSocialContain"
                                                                                   style="table-layout: auto;">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td valign="top" name="bmeSocialTD">
                                                                                        <!--[if gte mso 6]></td>
                                                                                        <td align="left" valign="top">
                                                                                        <![endif]-->
                                                                                        <table cellspacing="0"
                                                                                               cellpadding="0"
                                                                                               border="0"
                                                                                               class="bmeFollowItem"
                                                                                               type="facebook"
                                                                                               style="float:left;"
                                                                                               align="left">
                                                                                            <tbody>
                                                                                            <tr>
                                                                                                <td align="left"
                                                                                                    class="bmeFollowItemIcon"
                                                                                                    gutter="20"
                                                                                                    width="20"
                                                                                                    style="padding-right:20px;height:20px;">
                                                                                                    <a href="https://clt1672863.benchurl.com/c/l?u=10EC7B6E&amp;e=17DB0A7&amp;c=19869F&amp;t=1&amp;seq=1"
                                                                                                       target="_blank"
                                                                                                       style="display: inline-block;background-color: rgb(29, 28, 62);border-radius: 28px;border-style: solid; border-width: 2px; border-color: rgb(29, 28, 62);"><img
                                                                                                                src="https://ui.benchmarkemail.com/images/editor/socialicons/fb_btn.png"
                                                                                                                alt="Facebook"
                                                                                                                style="display: block; max-width: 114px;"
                                                                                                                border="0"
                                                                                                                width="24"
                                                                                                                height="24"></a>
                                                                                                </td>
                                                                                            </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        <!--[if gte mso 6]></td>
                                                                                        <td align="left" valign="top">
                                                                                        <![endif]-->
                                                                                        <table cellspacing="0"
                                                                                               cellpadding="0"
                                                                                               border="0"
                                                                                               class="bmeFollowItem"
                                                                                               type="instagram"
                                                                                               style="float:left;"
                                                                                               align="left">
                                                                                            <tbody>
                                                                                            <tr>
                                                                                                <td align="left"
                                                                                                    class="bmeFollowItemIcon"
                                                                                                    gutter="20"
                                                                                                    width="20"
                                                                                                    style="padding-right:20px;height:20px;">
                                                                                                    <a href="https://clt1672863.benchurl.com/c/l?u=10EC7B6F&amp;e=17DB0A7&amp;c=19869F&amp;t=1&amp;seq=1"
                                                                                                       target="_blank"
                                                                                                       style="display: inline-block;background-color: rgb(29, 28, 62);border-radius: 28px;border-style: solid; border-width: 2px; border-color: rgb(29, 28, 62);"><img
                                                                                                                src="https://ui.benchmarkemail.com/images/editor/socialicons/in_btn.png"
                                                                                                                alt="Instagram"
                                                                                                                style="display: block; max-width: 114px;"
                                                                                                                border="0"
                                                                                                                width="24"
                                                                                                                height="24"></a>
                                                                                                </td>
                                                                                            </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        <!--[if gte mso 6]></td>
                                                                                        <td align="left" valign="top">
                                                                                        <![endif]-->
                                                                                        <table cellspacing="0"
                                                                                               cellpadding="0"
                                                                                               border="0"
                                                                                               class="bmeFollowItem"
                                                                                               type="whatsapp"
                                                                                               style="float:left;"
                                                                                               align="left">
                                                                                            <tbody>
                                                                                            <tr>
                                                                                                <td align="left"
                                                                                                    class="bmeFollowItemIcon"
                                                                                                    gutter="20"
                                                                                                    width="20"
                                                                                                    style="height:20px;">
                                                                                                    <a href="https://clt1672863.benchurl.com/c/l?u=10EC7B70&amp;e=17DB0A7&amp;c=19869F&amp;t=1&amp;seq=1"
                                                                                                       target="_blank"
                                                                                                       style="display: inline-block; background-color: rgb(29, 28, 62); border-radius: 28px; border-width: 2px; border-color: rgb(29, 28, 62); border-style: solid;"
                                                                                                       data-code="212"
                                                                                                       data-phone="654795800"><img
                                                                                                                src="https://ui.benchmarkemail.com/images/editor/socialicons/whatsapp_btn.png"
                                                                                                                alt="WhatsApp"
                                                                                                                style="display: block; max-width: 114px;"
                                                                                                                border="0"
                                                                                                                width="24"
                                                                                                                height="24"></a>
                                                                                                </td>
                                                                                            </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_16" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 10px 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="dv_15" class="blk_wrapper" style="">
                                                    <table width="600" cellspacing="0" cellpadding="0" border="0"
                                                           class="blk" name="blk_divider" style="">
                                                        <tbody>
                                                        <tr>
                                                            <td class="tblCellMain"
                                                                style="padding: 10px 20px; border: none;">
                                                                <table class="tblLine" cellspacing="0" cellpadding="0"
                                                                       border="0" width="100%"
                                                                       style="border-top: 1px none rgb(225, 225, 225); min-width: 1px;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border: none;"><span></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr class="flexible-section" data-section-type="bmeFooter" id="section_10">
                                <td class="blk_container bmeHolder" width="100%" name="bmeFooter" valign="top"
                                    align="center" style="border: none;">
                                    <div class="blk_wrapper" id="dv_100" style="">
                                        <table width="600" cellspacing="0" cellpadding="0" border="0" class="blk"
                                               name="blk_footer" style="">
                                            <tbody>
                                            <tr>
                                                <td name="tblCell" class="tblCell"
                                                    style="padding: 20px; word-break: break-word;" valign="top"
                                                    align="left">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                        <tbody>
                                                        <tr>
                                                            <td name="bmeBadgeText"
                                                                style="text-align:center; word-break: break-word;"
                                                                align="center"><span id="spnFooterText"
                                                                                     style="font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-size: 11px; line-height: 140%;">This message was sent to ${username} by
<br>engflexy.com</span>
                                                                <br>
                                                                <br><span
                                                                        style="font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-size: 11px; line-height: 140%;"><span
                                                                            src="https://ui.benchmarkemail.com/images/verified.png"
                                                                            alt="Unsubscribe from all mailings"
                                                                            title="Unsubscribe from all mailings"
                                                                            border="0"></span> <a
                                                                            class="bmefootertext" target="_new"
                                                                            style="color:inherit;text-decoration:underline;">Unsubscribe</a>   | <a
                                                                            class="bmefootertext" target="_new"
                                                                            style="color:inherit;text-decoration:underline;">Manage Subscription</a>
<br></span></td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<!-- /Test Path -->


</body>
</html>