<tr>
    <td class="center-text">${question.rate}</td>
    <td>
        <g:link resource="/question" action="show" id="${question.id}" class="question-link">${question.title}</g:link>
    </td>
    <td>${formatDate(format:'dd/MM/yyyy', date:question.dateCreated)}</td>
</tr>