.class Lcom/android/launcher3/popup/PopupContainerWithArrow$e;
.super Ljava/lang/Object;
.source "PopupContainerWithArrow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/PopupContainerWithArrow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private a:J

.field private b:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(JLjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->b:Ljava/lang/CharSequence;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->b:Ljava/lang/CharSequence;

    .line 9
    .line 10
    iget-object v2, p1, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->b:Ljava/lang/CharSequence;

    .line 11
    .line 12
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-wide v2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->a:J

    .line 19
    .line 20
    iget-wide p0, p1, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->a:J

    .line 21
    .line 22
    cmp-long p0, v2, p0

    .line 23
    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->b:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-wide v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;->a:J

    .line 8
    .line 9
    long-to-int p0, v1

    .line 10
    xor-int/2addr p0, v0

    .line 11
    return p0
.end method
