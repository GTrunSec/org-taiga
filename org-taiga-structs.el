;;; org-taiga-structs.el --- Internal structs used by org-taiga -*- lexical-binding: t -*-

;; Copyright (c) 2019 Konstantin Sorokin (GNU/GPL Licence)

;; Authors: Konstantin Sorokin <sorokin.kc@gmail.com>

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

;;; Code:
(require 'jeison)

(jeison-defclass org-taiga-project nil
                 ((id) (name) (slug) (description) (milestones)))

(jeison-defclass org-taiga-milestone nil
                 ((id) (name) (slug) (stories :path user_stories)))

(jeison-defclass org-taiga-story nil
                 ((id) (subject) (tasks)))

(jeison-defclass org-taiga-task nil
                 ((id) (subject)))

(provide 'org-taiga-structs)
;;; org-taiga-structs.el ends here
