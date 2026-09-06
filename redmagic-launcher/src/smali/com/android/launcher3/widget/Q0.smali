.class public final synthetic Lcom/android/launcher3/widget/Q0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/WidgetCell;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/WidgetCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/Q0;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/Q0;->a:Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/widget/P$a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->h(Lcom/android/launcher3/widget/P$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
