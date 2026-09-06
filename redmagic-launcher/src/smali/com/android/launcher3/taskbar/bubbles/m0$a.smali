.class Lcom/android/launcher3/taskbar/bubbles/m0$a;
.super Ljava/lang/Object;
.source "BubbleControllers.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/g0$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/m0;->e(Lcom/android/launcher3/taskbar/J3;Lcom/android/launcher3/taskbar/R1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/R1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/launcher3/taskbar/R1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/m0$a;->a:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0$a;->a:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->b0()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b()Lcom/android/launcher3/util/v1$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0$a;->a:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x7

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
