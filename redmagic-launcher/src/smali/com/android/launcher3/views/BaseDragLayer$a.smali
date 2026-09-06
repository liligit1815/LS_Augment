.class Lcom/android/launcher3/views/BaseDragLayer$a;
.super Landroid/util/Property;
.source "BaseDragLayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/BaseDragLayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property<",
        "Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iput p0, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer$a;->a(Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/views/BaseDragLayer$a;->b(Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
