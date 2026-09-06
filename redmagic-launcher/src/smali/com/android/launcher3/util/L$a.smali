.class final Lcom/android/launcher3/util/L$a;
.super Ljava/lang/Object;
.source "DaggerSingletonTracker_Factory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/L;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# static fields
.field private static final a:Lcom/android/launcher3/util/L;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/L;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/L;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/L$a;->a:Lcom/android/launcher3/util/L;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a()Lcom/android/launcher3/util/L;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/L$a;->a:Lcom/android/launcher3/util/L;

    .line 2
    .line 3
    return-object v0
.end method
