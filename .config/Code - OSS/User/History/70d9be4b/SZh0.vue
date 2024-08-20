<template>
    <img src=`/afbeeldingen/${Astro.props.src}` alt={Astro.props.alt} class=`w-[100%] rounded-md border-slate-200 p-2
        ${Astro.props.border ? "border-solid border-2" : "" }` />
</template>