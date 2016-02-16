<tr>
    <td class="center-text">${question.rate}<br/><g:message code="question.index.votes"/></td>
    <td class="center-text">${question.answers.size()}<br/><g:message code="question.index.answers"/></td>
    <td class="center-text">${question.views}<br/><g:message code="question.index.views"/></td>
    <td>
        <g:link resource="/question" action="show" id="${question.id}" class="question-link">${question.title}</g:link>
        <div class="tags-bar">
            <g:each var="tag" in="${question.tags}">
                <g:link resource="/question" action="indexByTag" id="${tag.id}">
                    <button class="tag">${tag.label}</button>
                </g:link>
            </g:each>
        </div>
        <div class="date-author">
            <g:message code="home.page.question.item.dateauthor" args="${[formatDate(format:'dd/MM/yyyy',date:question.dateCreated),
                                                                          formatDate(format:'H:m',date:question.dateCreated)]}"/>
            <g:link resource="/user" action="show" id="${question.user.id}">${question.user.username}</g:link>
        </div>
    </td>
</tr>