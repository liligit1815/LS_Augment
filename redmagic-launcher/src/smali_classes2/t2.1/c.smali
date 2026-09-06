.class public final Lt2/c;
.super Ljava/lang/Object;
.source "Flags.java"


# static fields
.field private static a:Lt2/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lt2/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lt2/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lt2/c;->a:Lt2/a;

    .line 7
    .line 8
    return-void
.end method

.method public static a()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lt2/c;->a:Lt2/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lt2/a;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method
