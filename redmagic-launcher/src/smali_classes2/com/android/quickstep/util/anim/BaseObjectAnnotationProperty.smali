.class public interface abstract Lcom/android/quickstep/util/anim/BaseObjectAnnotationProperty;
.super Ljava/lang/Object;
.source "BaseObjectAnnotationProperty.java"

# interfaces
.implements Lcom/android/quickstep/util/anim/AnnotationProperty;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/quickstep/util/anim/AnnotationProperty;"
    }
.end annotation


# virtual methods
.method public varargs abstract call([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")TR;"
        }
    .end annotation
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getVisibility()Lcom/android/quickstep/util/anim/VisibilityEnum;
.end method

.method public abstract isAbstract()Z
.end method

.method public abstract isFinal()Z
.end method

.method public abstract isOpen()Z
.end method

.method public abstract isSuspend()Z
.end method
