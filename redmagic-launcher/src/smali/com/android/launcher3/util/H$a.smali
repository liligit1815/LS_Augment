.class public final Lcom/android/launcher3/util/H$a;
.super Lcom/android/launcher3/util/H;
.source "ContextTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/H;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/launcher3/v;",
        ">",
        "Lcom/android/launcher3/util/H<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/H;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/v;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->isStarted()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isHomeStarted(Lcom/android/launcher3/views/k;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/H$a;->a(Lcom/android/launcher3/v;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
