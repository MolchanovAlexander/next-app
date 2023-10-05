"use client"
import { CldUploadWidget } from 'next-cloudinary';

 export default <CldUploadWidget uploadPreset="restaurant">
        {({ open }) => {
            function handleOnClick(e: { preventDefault: () => void; }) {
                e.preventDefault();
                open();
            }
            return (
                <button className="button" onClick={handleOnClick}>
                    Upload an Image
                </button>
            );
        }}
    </CldUploadWidget>
