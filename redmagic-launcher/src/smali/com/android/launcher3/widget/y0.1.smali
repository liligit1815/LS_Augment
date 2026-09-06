.class public Lcom/android/launcher3/widget/y0;
.super Lcom/android/launcher3/W4;
.source "PendingAddShortcutInfo.java"


# instance fields
.field protected l:LD1/i;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/W4;-><init>()V

    return-void
.end method

.method public constructor <init>(LD1/i;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/W4;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/widget/y0;->l:LD1/i;

    .line 3
    invoke-virtual {p1}, LD1/i;->g()Landroid/content/ComponentName;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 4
    invoke-virtual {p1}, LD1/i;->e()Landroid/os/UserHandle;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 5
    invoke-virtual {p1}, LD1/i;->d()I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    const/16 p1, -0x69

    .line 6
    iput p1, p0, Lcom/android/launcher3/model/data/y;->container:I

    return-void
.end method


# virtual methods
.method public P(Landroid/content/Context;)LD1/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/y0;->l:LD1/i;

    .line 2
    .line 3
    return-object p0
.end method
