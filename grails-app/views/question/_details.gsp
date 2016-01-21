<table>
    <tr>
        <td><g:message code="question.details.asked"/></td>
        <td><g:formatDate format="d MMM yyyy" date="${question.dateCreated}"/></td>
    </tr>
    <tr>
        <td><g:message code="question.details.viewed"/></td>
        <td><g:message code="question.details.views" args="${[question.views]}"/></td>
    </tr>
    <tr>
        <td><g:message code="question.details.status"/></td>
        <td>
            <g:if test="${question.isClosed}">
                <g:message code="question.details.status.closed"/>
            </g:if>
            <g:else>
                <g:message code="question.details.status.open"/>
            </g:else>
        </td>
    </tr>
</table>