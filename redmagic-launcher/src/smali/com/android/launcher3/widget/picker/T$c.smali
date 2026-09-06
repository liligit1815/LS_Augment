.class public Lcom/android/launcher3/widget/picker/T$c;
.super Ljava/lang/Object;
.source "WidgetsListAdapter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/picker/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lm2/g;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/util/T0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/T0;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/util/T0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T$c;->g:Lcom/android/launcher3/util/T0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lm2/g;Lm2/g;)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T$c;->g:Lcom/android/launcher3/util/T0;

    .line 2
    .line 3
    iget-object v0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/util/T0;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    iget-object p0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 29
    .line 30
    iget-object p2, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_1
    iget-object p0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    const/4 p0, -0x1

    .line 57
    return p0

    .line 58
    :cond_2
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lm2/g;

    .line 2
    .line 3
    check-cast p2, Lm2/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/picker/T$c;->a(Lm2/g;Lm2/g;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
