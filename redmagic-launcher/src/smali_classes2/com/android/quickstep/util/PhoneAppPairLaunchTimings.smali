.class public final Lcom/android/quickstep/util/PhoneAppPairLaunchTimings;
.super Lcom/android/quickstep/util/AppPairLaunchTimings;
.source "PhoneAppPairLaunchTimings.kt"

# interfaces
.implements Lcom/android/quickstep/util/SplitAnimationTimings;


# instance fields
.field private final STAGED_RECT_SLIDE_DURATION:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1f4

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/PhoneAppPairLaunchTimings;->STAGED_RECT_SLIDE_DURATION:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getDuration()I
    .locals 0

    .line 1
    const/16 p0, 0x393

    .line 2
    .line 3
    return p0
.end method

.method protected getSTAGED_RECT_SLIDE_DURATION()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/PhoneAppPairLaunchTimings;->STAGED_RECT_SLIDE_DURATION:I

    .line 2
    .line 3
    return p0
.end method
