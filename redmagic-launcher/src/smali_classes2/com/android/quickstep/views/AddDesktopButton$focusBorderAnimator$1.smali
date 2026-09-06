.class final synthetic Lcom/android/quickstep/views/AddDesktopButton$focusBorderAnimator$1;
.super Lkotlin/jvm/internal/m;
.source "AddDesktopButton.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/AddDesktopButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/l<",
        "Landroid/graphics/Rect;",
        "Lh4/t;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v5, "getBorderBounds(Landroid/graphics/Rect;)V"

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    const-class v3, Lcom/android/quickstep/views/AddDesktopButton;

    .line 6
    .line 7
    const-string v4, "getBorderBounds"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v2, p1

    .line 11
    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/AddDesktopButton$focusBorderAnimator$1;->invoke(Landroid/graphics/Rect;)V

    sget-object p0, Lh4/t;->a:Lh4/t;

    return-object p0
.end method

.method public final invoke(Landroid/graphics/Rect;)V
    .locals 1

    const-string v0, "p0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lkotlin/jvm/internal/f;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/android/quickstep/views/AddDesktopButton;

    invoke-static {p0, p1}, Lcom/android/quickstep/views/AddDesktopButton;->access$getBorderBounds(Lcom/android/quickstep/views/AddDesktopButton;Landroid/graphics/Rect;)V

    return-void
.end method
