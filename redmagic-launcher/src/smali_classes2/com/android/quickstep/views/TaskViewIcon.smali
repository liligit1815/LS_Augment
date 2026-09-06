.class public interface abstract Lcom/android/quickstep/views/TaskViewIcon;
.super Ljava/lang/Object;
.source "TaskViewIcon.java"


# virtual methods
.method public abstract asView()Landroid/view/View;
.end method

.method public abstract callOnClick()Z
.end method

.method public abstract getAlpha()F
.end method

.method public abstract getDrawable()Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end method

.method public abstract getDrawableHeight()I
.end method

.method public abstract getDrawableWidth()I
.end method

.method public abstract getHeight()I
.end method

.method public abstract getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
.end method

.method public abstract getWidth()I
.end method

.method public abstract performLongClick()Z
.end method

.method public abstract setContentAlpha(F)V
.end method

.method public abstract setDrawable(Landroid/graphics/drawable/Drawable;)V
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setDrawableSize(II)V
.end method

.method public abstract setFlexSplitAlpha(F)V
.end method

.method public abstract setIconColorTint(IF)V
.end method

.method public abstract setIconOrientation(Lcom/android/quickstep/util/RecentsOrientedState;Z)V
.end method

.method public abstract setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
.end method

.method public abstract setModalAlpha(F)V
.end method

.method public abstract setOnClickListener(Landroid/view/View$OnClickListener;)V
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .param p1    # Landroid/view/View$OnLongClickListener;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setRotation(F)V
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract setVisibility(I)V
.end method
