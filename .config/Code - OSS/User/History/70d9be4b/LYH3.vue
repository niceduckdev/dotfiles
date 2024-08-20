<script setup>
defineProps({
    src: String,
    alt: String,
    border: Boolean
});
</script>

<template>
    <img :src="`/afbeeldingen/${src}`" :alt="alt"
        class="w-[100%] rounded-md border-slate-200 p-2 border-solid border-2" />
</template>