import React from "react";

function Loading(){
    return(
        <div className="text-center"> 
            <div className="spinner-borser" role="status">
                <span className="sr-only">
                    Loading.....
                </span>
            </div>
        </div>
    );
}

export default Loading;