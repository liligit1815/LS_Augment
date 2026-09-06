.class public final Lcom/android/launcher3/taskbar/c5$b;
.super Ljava/lang/Object;
.source "VoiceInteractionWindowController.kt"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/c5;->q(Landroid/view/View;Lu4/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Lcom/android/launcher3/taskbar/c5;


# direct methods
.method constructor <init>(Lu4/a;Landroid/view/View;Lcom/android/launcher3/taskbar/c5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Lcom/android/launcher3/taskbar/c5;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5$b;->g:Lu4/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/c5$b;->h:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/c5$b;->i:Lcom/android/launcher3/taskbar/c5;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/c5$b;->g:Lu4/a;

    .line 7
    .line 8
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/c5$b;->h:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5$b;->i:Lcom/android/launcher3/taskbar/c5;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/c5;->i(Lcom/android/launcher3/taskbar/c5;Landroid/view/View$OnAttachStateChangeListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p0, "v"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
