;;; TEMPLATE.el.tpl --- (>>>POINT<<<)

;; Copyright (>>>YEAR<<<) (>>>USER_NAME<<<)
;;
;; Author: (>>>AUTHOR<<<)
;; Version: $Id: (>>>FILE<<<),v 0.0 (>>>VC_DATE<<<) (>>>LOGIN_NAME<<<) Exp $
;; Keywords: (>>>1<<<)
;; X-URL: not distributed yet

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

(defun (>>>FILE_SANS<<<) ()
  "Settings for `(>>>POINT<<<)'.")

(eval-after-load ""
  `((>>>FILE_SANS<<<)))

(provide '(>>>FILE_SANS<<<))
