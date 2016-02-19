package fr.isima.grails

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String email
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String email, String password) {
		this()
		this.username = username
		this.email = email
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	public Integer getReputation() {
		return EnumReputation.ANSWER.score * this.answers.size() + EnumReputation.QUESTION.score * this.questions.size() + EnumReputation.COMMENT.score * this.comments.size()
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		email blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	static hasMany = [questions : Question,
					  answers  : Answer,
					  comments : Comment,
	   				  badges   : Badge]
}
