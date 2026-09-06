.class Lcom/android/launcher3/util/Z$a;
.super Ljava/lang/Object;
.source "DisplayController.java"

# interfaces
.implements Landroid/hardware/display/DisplayManager$DisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/util/Z;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Lcom/android/launcher3/J3;Lcom/android/launcher3/util/K;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/hardware/display/DisplayManager;

.field final synthetic b:Lcom/android/launcher3/util/Z;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/Z;Landroid/hardware/display/DisplayManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/Z$a;->b:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/util/Z$a;->a:Landroid/hardware/display/DisplayManager;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDisplayAdded(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$a;->b:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/Z$a;->a:Landroid/hardware/display/DisplayManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, p0}, Lcom/android/launcher3/util/Z;->k(Lcom/android/launcher3/util/Z;Landroid/view/Display;)Lcom/android/launcher3/util/Z$d;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onDisplayChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$a;->b:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z;->R(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
