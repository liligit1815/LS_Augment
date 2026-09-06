.class public Lcom/android/launcher3/testing/TestInformationProvider;
.super Lcom/android/launcher3/util/F;
.source "TestInformationProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/F;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;)Lcom/android/launcher3/util/F$a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/testing/TestInformationProvider$a;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/testing/TestInformationProvider$a;-><init>(Lcom/android/launcher3/testing/TestInformationProvider;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method
