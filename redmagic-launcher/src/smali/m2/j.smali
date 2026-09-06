.class public Lm2/j;
.super Lm2/g;
.source "WidgetsListEnterEntry.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 13
    .line 14
    invoke-direct {p0, v0, v2, v1}, Lm2/g;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public d()Lm2/g;
    .locals 0

    .line 1
    new-instance p0, Lm2/j;

    .line 2
    .line 3
    invoke-direct {p0}, Lm2/j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
