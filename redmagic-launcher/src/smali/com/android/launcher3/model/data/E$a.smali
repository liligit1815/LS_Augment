.class public final Lcom/android/launcher3/model/data/E$a;
.super Ljava/lang/Object;
.source "TaskViewItemInfo.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/model/data/E;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/E$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(IILjava/lang/String;I)Lcom/android/launcher3/logger/LauncherAtom$TaskView;
    .locals 0

    .line 1
    const-string p0, "componentName"

    .line 2
    .line 3
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;->setType(I)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p3}, Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;->setComponentName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p4}, Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;->setCardinality(I)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "build(...)"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 32
    .line 33
    return-object p0
.end method
