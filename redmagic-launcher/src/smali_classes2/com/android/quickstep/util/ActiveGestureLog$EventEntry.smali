.class public Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;
.super Ljava/lang/Object;
.source "ActiveGestureLog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/ActiveGestureLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "EventEntry"
.end annotation


# instance fields
.field private duplicateCount:I

.field private gestureEvent:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field private mCompoundString:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

.field private time:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/util/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;-><init>()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->duplicateCount:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->gestureEvent:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->mCompoundString:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->time:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->duplicateCount:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->update(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private update(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->mCompoundString:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->gestureEvent:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    iput-wide p1, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->time:J

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->duplicateCount:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getDuplicateCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->duplicateCount:I

    .line 2
    .line 3
    return p0
.end method

.method protected getGestureEvent()Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->gestureEvent:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->time:J

    .line 2
    .line 3
    return-wide v0
.end method
