.class Lcom/android/launcher3/views/q$a;
.super Landroid/util/IntProperty;
.source "ArrowTipView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/IntProperty<",
        "Lcom/android/launcher3/views/q;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/IntProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/views/q;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/views/q;->T(Lcom/android/launcher3/views/q;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Lcom/android/launcher3/views/q;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/android/launcher3/views/q;->U(Lcom/android/launcher3/views/q;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/views/q;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/q$a;->a(Lcom/android/launcher3/views/q;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/views/q;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/views/q$a;->b(Lcom/android/launcher3/views/q;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
