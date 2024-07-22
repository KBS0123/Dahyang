document.getElementById('likeButton').addEventListener('click', function() {
        const fid = this.getAttribute('data-fid');
        const clid = this.getAttribute('data-clid');
        const uid = this.getAttribute('data-uid');
        
        fetch('http://localhost:8081/Dahyang_project/views/club/{clid}/feed/like', {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/json'
		    },
		    body: JSON.stringify({ uid, fid, clid })
		})
		.then(response => response.json())
		.then(data => {
		    console.log(data);  // 데이터 확인
		    if (data.liked) {
		        this.classList.remove('not-liked');
		        this.classList.add('liked');
		    } else {
		        this.classList.remove('liked');
		        this.classList.add('not-liked');
		    }
		})
		.catch(error => {
		    console.error('Error:', error);
		});
    });