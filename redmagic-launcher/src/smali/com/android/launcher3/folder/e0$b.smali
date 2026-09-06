.class Lcom/android/launcher3/folder/e0$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderPreviewItemAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/e0;-><init>(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;IIIIILjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/lang/Runnable;

.field final synthetic h:Lcom/android/launcher3/folder/y0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/e0;Ljava/lang/Runnable;Lcom/android/launcher3/folder/y0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/folder/e0$b;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/folder/e0$b;->h:Lcom/android/launcher3/folder/y0;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/e0$b;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/e0$b;->h:Lcom/android/launcher3/folder/y0;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 12
    .line 13
    return-void
.end method
