.class public abstract Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;
.super Landroid/os/Binder;
.source "IDigitalHumanClientCallback.java"

# interfaces
.implements Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_onHumanInited:I = 0x1

.field static final TRANSACTION_onMotionStart:I = 0x4

.field static final TRANSACTION_onMotionStop:I = 0x5

.field static final TRANSACTION_onSpeakStart:I = 0x2

.field static final TRANSACTION_onSpeakStop:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanClientCallback"

    .line 5
    .line 6
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const-string v0, "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanClientCallback"

    .line 6
    .line 7
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    instance-of v1, v0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub$Proxy;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 1
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanClientCallback"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-lt p1, v1, :cond_0

    .line 5
    .line 6
    const v2, 0xffffff

    .line 7
    .line 8
    .line 9
    if-gt p1, v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const v2, 0x5f4e5446

    .line 15
    .line 16
    .line 17
    if-eq p1, v2, :cond_6

    .line 18
    .line 19
    if-eq p1, v1, :cond_5

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    if-eq p1, v0, :cond_4

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    if-eq p1, v0, :cond_3

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    if-eq p1, v0, :cond_2

    .line 29
    .line 30
    const/4 v0, 0x5

    .line 31
    if-eq p1, v0, :cond_1

    .line 32
    .line 33
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_1
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 39
    .line 40
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 45
    .line 46
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onMotionStop(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 54
    .line 55
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onMotionStart(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 73
    .line 74
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 79
    .line 80
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onSpeakStop(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 88
    .line 89
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 94
    .line 95
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onSpeakStart(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onHumanInited()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 110
    .line 111
    .line 112
    :goto_0
    return v1

    .line 113
    :cond_6
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return v1
.end method
