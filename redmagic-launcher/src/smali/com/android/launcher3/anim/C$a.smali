.class Lcom/android/launcher3/anim/C$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AppOCAnimHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/C;->v0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/C$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/anim/C$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/anim/C$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
