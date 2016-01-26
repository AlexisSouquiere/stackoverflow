<table>
    <tbody>
        <g:each var="comment" in="${comments}">
            <g:render template="/comment/item" model="${[comment: comment]}" var="comment"/>
        </g:each>
    </tbody>
</table>