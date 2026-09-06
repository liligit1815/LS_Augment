.class Lcom/android/launcher3/folder/A0$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewItemManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/A0;->t(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/A0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/A0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/A0$b;->g:Lcom/android/launcher3/folder/A0;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/A0$b;->g:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/folder/A0;->d(Lcom/android/launcher3/folder/A0;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
