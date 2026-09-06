.class public interface abstract Lcom/android/launcher3/util/window/b;
.super Ljava/lang/Object;
.source "RefreshRateTracker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/window/b$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/util/window/b$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/window/b$a;->a:Lcom/android/launcher3/util/window/b$a;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/util/window/b;->a:Lcom/android/launcher3/util/window/b$a;

    .line 4
    .line 5
    return-void
.end method

.method public static a(Landroid/content/Context;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/window/b;->a:Lcom/android/launcher3/util/window/b$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/window/b$a;->a(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public abstract getSingleFrameMs()I
.end method
