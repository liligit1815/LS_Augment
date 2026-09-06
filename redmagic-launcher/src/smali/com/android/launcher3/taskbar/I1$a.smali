.class Lcom/android/launcher3/taskbar/I1$a;
.super Ljava/lang/Object;
.source "TaskbarActivityContext.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/I1;->D2(Landroid/animation/AnimatorSet;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/animation/AnimatorSet;

.field final synthetic h:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/I1;Landroid/animation/AnimatorSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1$a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/I1$a;->g:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1$a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/I1;->Y(Lcom/android/launcher3/taskbar/I1;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1$a;->g:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1$a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/android/launcher3/taskbar/I1;->Y(Lcom/android/launcher3/taskbar/I1;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1$a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/taskbar/I1;->X(Lcom/android/launcher3/taskbar/I1;)Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1$a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/android/launcher3/taskbar/I1;->Y(Lcom/android/launcher3/taskbar/I1;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v0, Lcom/android/launcher3/taskbar/H1;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/H1;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, p0, v0}, Lu2/I;->b(Landroid/view/View;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
