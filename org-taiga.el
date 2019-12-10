;;; org-taiga.el --- Integration between taiga project management and emacs org-mode -*- lexical-binding: t -*-

;; Copyright (c) 2019 Konstantin Sorokin (GNU/GPL Licence)

;; Authors: Konstantin Sorokin <sorokin.kc@gmail.com>
;; URL: http://github.com/xmagpie/org-taiga
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.2") (request "0.3.2") (jeison "1.0.0"))
;; Keywords: tools, org-mode, taiga, project-management

;; This file is NOT part of GNU Emacs.

;; This application is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This application is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this application.
;; If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;;
;;;
;;;

;;; Code:
(defgroup org-taiga nil
  "Custom group for org-taiga"
  :group 'org)

(defcustom org-taiga-url "http://localhost:8000"
  "URL of taiga instance to connect to."
  :group 'org-taiga
  :type 'string)

(defcustom org-taiga-auth-token nil
  "Authentication token used at `org-taiga-url'.

Refer to taiga REST API docs to get information on how to get it."
  :group 'org-taiga
  :type 'string)

(defcustom org-taiga-project-slug nil
  "Project slug used to access milestones, user stories etc."
  :group 'org-taiga
  :type 'string)

(provide 'org-taiga)
;;; org-taiga.el ends here
