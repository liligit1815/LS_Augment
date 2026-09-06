.class public final Lcom/android/launcher3/taskbar/b0$b;
.super Ljava/lang/Object;
.source "ManageWindowsTaskbarShortcut.kt"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/b0;->Q(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/b0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/taskbar/b0<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/b0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/taskbar/b0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b0$b;->g:Lcom/android/launcher3/taskbar/b0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
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

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/b0$b;->g:Lcom/android/launcher3/taskbar/b0;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/taskbar/b0;->O(Lcom/android/launcher3/taskbar/b0;)Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 13
    .line 14
    const/16 v0, 0x80

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0$b;->g:Lcom/android/launcher3/taskbar/b0;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/taskbar/b0;->O(Lcom/android/launcher3/taskbar/b0;)Lcom/android/launcher3/taskbar/R1;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->i()V

    .line 29
    .line 30
    .line 31
    return-void
.end method
