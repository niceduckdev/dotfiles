<script setup>
defineProps({
    title: String,
    subtitle: String,
    image: String
});
</script>

<template>
    <header className="h-52 mb-3 flex flex-col items-center justify-center bg-bottom bg-cover rounded-md"
        :style="`background-image: url('/afbeeldingen/${image}')`">
        <h1 className="font-extrabold text-5xl text-white text-center">{{ title }}</h1>
        <h5 className="font-bold text-lg text-white text-center px-5">{{ subtitle }}</h5>
    </header>
    <slot></slot>
</template>