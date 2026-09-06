.class public final Lcom/android/launcher3/logger/d$a;
.super Lcom/google/protobuf/y$a;
.source "LauncherAtomExtensions.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "Lcom/android/launcher3/logger/d;",
        "Lcom/android/launcher3/logger/d$a;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, Lcom/android/launcher3/logger/d;->a()Lcom/android/launcher3/logger/d;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logger/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logger/d$a;-><init>()V

    return-void
.end method
