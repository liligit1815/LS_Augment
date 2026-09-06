.class public final Lcom/android/launcher3/taskbar/customization/CustomizableTaskbarView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "CustomizableTaskbarView.kt"

# interfaces
.implements Lcom/android/launcher3/g1;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "lookupContext(...)"

    .line 14
    .line 15
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    check-cast p2, Lcom/android/launcher3/taskbar/I1;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/android/launcher3/taskbar/customization/CustomizableTaskbarView;->g:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    const p2, 0x7f0e00a5

    .line 23
    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Landroid/view/ViewGroup;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public setInsets(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method
