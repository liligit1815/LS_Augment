.class Lcom/android/launcher3/folder/Folder$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Folder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/Folder;->y0(Landroid/animation/AnimatorSet;Lcom/android/launcher3/CellLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/CellLayout;

.field final synthetic i:Z


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;ZLcom/android/launcher3/CellLayout;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder$d;->g:Z

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/folder/Folder$d;->h:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/android/launcher3/folder/Folder$d;->i:Z

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/folder/Folder$d;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$d;->h:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder$d;->i:Z

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/android/launcher3/CellLayout;->D(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/folder/Folder$d;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$d;->h:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->D(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
