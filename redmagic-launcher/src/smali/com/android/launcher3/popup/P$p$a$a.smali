.class Lcom/android/launcher3/popup/P$p$a$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/P$p$a;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/popup/P$p$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/popup/P$p$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/P$p$a$a;->g:Lcom/android/launcher3/popup/P$p$a;

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
    iget-object p1, p0, Lcom/android/launcher3/popup/P$p$a$a;->g:Lcom/android/launcher3/popup/P$p$a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/popup/P$p$a$a;->g:Lcom/android/launcher3/popup/P$p$a;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/popup/P$p$a;->h:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/Workspace;->E2(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
