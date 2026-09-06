.class public Lcom/android/launcher3/MainProcessInitializer;
.super Ljava/lang/Object;
.source "MainProcessInitializer.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/MainProcessInitializer;

    .line 2
    .line 3
    const v1, 0x7f140241

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/android/launcher3/MainProcessInitializer;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/android/launcher3/MainProcessInitializer;->init(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method protected init(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/logging/b;->n(Ljava/io/File;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
