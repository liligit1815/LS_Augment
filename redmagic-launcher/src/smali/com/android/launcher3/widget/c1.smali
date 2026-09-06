.class public final synthetic Lcom/android/launcher3/widget/c1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/WidgetsBottomSheet;

.field public final synthetic b:Landroid/widget/TableLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/WidgetsBottomSheet;Landroid/widget/TableLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/c1;->a:Lcom/android/launcher3/widget/WidgetsBottomSheet;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/c1;->b:Landroid/widget/TableLayout;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/c1;->a:Lcom/android/launcher3/widget/WidgetsBottomSheet;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/c1;->b:Landroid/widget/TableLayout;

    .line 4
    .line 5
    check-cast p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->Y0(Lcom/android/launcher3/widget/WidgetsBottomSheet;Landroid/widget/TableLayout;Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
