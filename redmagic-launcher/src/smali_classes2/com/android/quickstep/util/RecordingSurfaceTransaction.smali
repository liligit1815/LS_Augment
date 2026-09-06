.class public Lcom/android/quickstep/util/RecordingSurfaceTransaction;
.super Lcom/android/quickstep/util/SurfaceTransaction;
.source "RecordingSurfaceTransaction.java"


# instance fields
.field public final mockProperties:Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;-><init>(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/RecordingSurfaceTransaction;->mockProperties:Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;

    .line 10
    .line 11
    return-void
.end method
