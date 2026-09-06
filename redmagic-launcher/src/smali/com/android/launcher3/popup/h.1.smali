.class public final synthetic Lcom/android/launcher3/popup/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/C2;

.field public final synthetic b:Lcom/android/launcher3/model/data/I;

.field public final synthetic c:Lcom/android/launcher3/widget/suggest/a;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/widget/suggest/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/h;->a:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/popup/h;->b:Lcom/android/launcher3/model/data/I;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/popup/h;->c:Lcom/android/launcher3/widget/suggest/a;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/h;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/popup/h;->b:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/popup/h;->c:Lcom/android/launcher3/widget/suggest/a;

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/popup/P$i;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->Q(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/widget/suggest/a;Lcom/android/launcher3/popup/P$i;)Lcom/android/launcher3/popup/P;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
