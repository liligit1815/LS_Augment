.class Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;
.super Ljava/lang/Object;
.source "MFVDockExpandSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/MFVDockExpandSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CallShardStateData"
.end annotation

.annotation build Le/a;
.end annotation


# instance fields
.field CallId:Ljava/lang/String;

.field Location:Ljava/lang/String;

.field Name:Ljava/lang/String;

.field Number:Ljava/lang/String;

.field State:I

.field isMute:Z


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getPhoneState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;->State:I

    .line 2
    .line 3
    return p0
.end method
